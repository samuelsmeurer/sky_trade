#if not defined(ARDUINO_ARCH_ESP32)
#error "This program requires an ESP32"
#endif

#pragma GCC diagnostic warning "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"

//

#include <Arduino.h>

#include <esp_wifi.h>
#include <esp_event_loop.h>
#include <nvs_flash.h>

#include "opendroneid.h"

//

#define DIAGNOSTICS        1
#define DUMP_ODID_FRAME    0

#define WIFI_SCAN          1
#define BLE_SCAN           0 // Disable BLE scan to reduce sketch size.

#define SD_LOGGER          0
#define SD_CS              5
#define SD_LOGGER_LED      2

#define ID_SIZE     (ODID_ID_SIZE + 1)
#define MAX_UAVS           2  // Reduced number of UAVs to decrease memory usage.
#define OP_DISPLAY_LIMIT  16
#define WIFI_CHANNEL_SWITCH_INTERVAL 5000 // Switch WiFi channel every 5 seconds

//

#if SD_LOGGER

#include <SD.h>
// #include <SdFat.h>

// #define SD_CONFIG       SdSpiConfig(SD_CS,DEDICATED_SPI,SD_SCK_MHZ(16))

#endif

//

struct id_data {int       flag;
                uint8_t   mac[6];
                uint32_t  last_seen;
                char      op_id[ID_SIZE];
                double    lat_d, long_d;
                int       altitude_msl, speed, rssi;};  // Removed some fields to save memory.

//

static void               print_json(int,int,struct id_data *);
static esp_err_t          event_handler(void *,system_event_t *);
static void               callback(void *,wifi_promiscuous_pkt_type_t);
static struct id_data    *next_uav(uint8_t *);
static void               parse_french_id(struct id_data *,uint8_t *);
static void               parse_odid(struct id_data *,ODID_UAS_Data *);
                        
volatile char             ssid[10];
volatile unsigned int     callback_counter = 0, french_wifi = 0, odid_wifi = 0;
volatile struct id_data   uavs[MAX_UAVS + 1];

volatile ODID_UAS_Data    UAS_data;

uint8_t current_wifi_channel = 1; // Start at WiFi channel 1
uint32_t last_channel_switch = 0; // Timestamp of the last channel switch

//

static const char        *title = "RID Scanner", *build_date = __DATE__;

/*
 *
 */

void setup() {

  memset((void *) &UAS_data,0,sizeof(ODID_UAS_Data));
  memset((void *) uavs,0,(MAX_UAVS + 1) * sizeof(struct id_data));
  memset((void *) ssid,0,10);

  strcpy((char *) uavs[MAX_UAVS].op_id,"NONE");

  delay(100);

  Serial.begin(115200);

  Serial.printf("\r\n{ \"title\": \"%s\" }\r\n",title);
  Serial.printf("{ \"build date\": \"%s\" }\r\n",build_date);

  //

  nvs_flash_init();
  tcpip_adapter_init();

  esp_event_loop_init(event_handler,NULL);

#if WIFI_SCAN

  wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();

  esp_wifi_init(&cfg);
  esp_wifi_set_storage(WIFI_STORAGE_RAM);
  esp_wifi_set_mode(WIFI_MODE_NULL);
  esp_wifi_start();
  esp_wifi_set_promiscuous(true);
  esp_wifi_set_promiscuous_rx_cb(&callback); 

  esp_wifi_set_channel(current_wifi_channel,WIFI_SECOND_CHAN_NONE);

#endif

  Serial.print("{ \"message\": \"setup() complete\" }\r\n");

  return;
}

/*
 *
 */

void loop() {

  int             i;
  uint32_t        msecs;
  static uint32_t last_json = 0;

  //
  
  msecs = millis();

  // Periodically switch WiFi channels to increase chances of detecting drones
  if ((msecs - last_channel_switch) > WIFI_CHANNEL_SWITCH_INTERVAL) {
    current_wifi_channel = (current_wifi_channel % 13) + 1; // Cycle through channels 1-13
    esp_wifi_set_channel(current_wifi_channel, WIFI_SECOND_CHAN_NONE);
    Serial.printf("\r\n{ \"message\": \"Switching to channel %d\" }\r\n", current_wifi_channel);
    last_channel_switch = msecs;
  }

  for (i = 0; i < MAX_UAVS; ++i) {

    if ((uavs[i].last_seen)&&
        ((msecs - uavs[i].last_seen) > 300000L)) {

      Serial.printf("\r\n{ \"message\": \"Drone %d timed out\" }\r\n", i);
      uavs[i].last_seen = 0;
      uavs[i].mac[0]    = 0;
    }

    if (uavs[i].flag) {

      print_json(i,msecs / 1000,(id_data *) &uavs[i]);
      uavs[i].flag = 0;

      last_json = msecs;
    }
  }

  if ((msecs - last_json) > 60000UL) { // Keep the serial link active

      print_json(MAX_UAVS,msecs / 1000,(id_data *) &uavs[MAX_UAVS]); 
      last_json = msecs;
  }

  return;
}

/*
 *
 */

void print_json(int index,int secs,struct id_data *UAV) {

  if (UAV->mac[0] == 0) {
    Serial.printf("{ \"index\": %d, \"runtime\": %d, \"message\": \"No data\" }\r\n", index, secs);
    return;
  }

  char text[128];
  dtostrf(UAV->lat_d,11,6,text);

  sprintf(text,"{ \"index\": %d, \"runtime\": %d, \"mac\": \"%02x:%02x:%02x:%02x:%02x:%02x\", \"id\": \"%s\", \"latitude\": %s, \"longitude\": %.6f, \"altitude_msl\": %d, \"speed\": %d, \"rssi\": %d }",
          index,secs,
          UAV->mac[0],UAV->mac[1],UAV->mac[2],UAV->mac[3],UAV->mac[4],UAV->mac[5],
          UAV->op_id, text, UAV->long_d, UAV->altitude_msl, UAV->speed, UAV->rssi);
  Serial.print(text);

  return;
}

/*
 *
 */

esp_err_t event_handler(void *ctx, system_event_t *event) {
  
  return ESP_OK;
}

/*
 * This function handles WiFi packets.
 */

void callback(void* buffer,wifi_promiscuous_pkt_type_t type) {

  int                     length;
  uint8_t                *payload;
  wifi_promiscuous_pkt_t *packet;
  struct id_data         *UAV = NULL;
  static uint8_t          mac[6], nan_dest[6] = {0x51, 0x6f, 0x9a, 0x01, 0x00, 0x00};

  ++callback_counter;

  packet    = (wifi_promiscuous_pkt_t *) buffer;
  payload   = packet->payload;
  length    = packet->rx_ctrl.sig_len;

  Serial.printf("{ \"message\": \"Callback triggered. Packet length: %d, Type: %d\" }\r\n", length, type);

  UAV = next_uav(&payload[10]);
  memcpy(UAV->mac,&payload[10],6);
  UAV->rssi      = packet->rx_ctrl.rssi;
  UAV->last_seen = millis();

  if (memcmp(nan_dest,&payload[4],6) == 0) {

    Serial.print("{ \"message\": \"Possible NaN destination matched. Attempting to decode.\" }\r\n");

    if (odid_wifi_receive_message_pack_nan_action_frame((ODID_UAS_Data *) &UAS_data,(char *) mac,payload,length) == 0) {

      ++odid_wifi;
      parse_odid(UAV,(ODID_UAS_Data *) &UAS_data);
      Serial.printf("\r\n{ \"message\": \"Drone detected on channel %d\", \"mac\": \"%02x:%02x:%02x:%02x:%02x:%02x\" }\r\n",
                    current_wifi_channel, UAV->mac[0], UAV->mac[1], UAV->mac[2], UAV->mac[3], UAV->mac[4], UAV->mac[5]);
    } else {
      Serial.print("{ \"message\": \"Failed to decode ODID message pack\" }\r\n");
    }
  }

  if ((!UAV->op_id[0])&&(!UAV->lat_d)) {
    UAV->mac[0] = 0;
  }

  return;
}

/*
 *
 */

struct id_data *next_uav(uint8_t *mac) {

  int             i;
  struct id_data *UAV = NULL;

  for (i = 0; i < MAX_UAVS; ++i) {

    if (memcmp((void *) uavs[i].mac,mac,6) == 0) {
      UAV = (struct id_data *) &uavs[i];
    }
  }

  if (!UAV) {
    for (i = 0; i < MAX_UAVS; ++i) {
      if (!uavs[i].mac[0]) {
        UAV = (struct id_data *) &uavs[i];
        break;
      }
    }
  }

  if (!UAV) {
     UAV = (struct id_data *) &uavs[MAX_UAVS - 1];
  }

  return UAV;
}

/*
 *
 */

void parse_odid(struct id_data *UAV,ODID_UAS_Data *UAS_data2) {

  if (UAS_data2->BasicIDValid[0]) {
    UAV->flag = 1;
    strncpy((char *) UAV->op_id,(char *) UAS_data2->BasicID[0].UASID,ID_SIZE);
  }

  if (UAS_data2->LocationValid) {
    UAV->flag         = 1;
    UAV->lat_d        = UAS_data2->Location.Latitude;
    UAV->long_d       = UAS_data2->Location.Longitude;
    UAV->altitude_msl = (int) UAS_data2->Location.AltitudeGeo;
    UAV->speed        = (int) UAS_data2->Location.SpeedHorizontal;
  }

  return;
}

/*
 *
 */
