#if not defined(ARDUINO_ARCH_ESP32)
#error "This program requires an ESP32"
#endif

#pragma GCC diagnostic warning "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"

#include <Arduino.h>
#include <esp_wifi.h>
#include <esp_event_loop.h>
#include <nvs_flash.h>
#include "opendroneid.h"


#define WIFI_SCAN          1
#define ID_SIZE     (ODID_ID_SIZE + 1)
#define MAX_UAVS           8
#define OP_DISPLAY_LIMIT  16


struct id_data {int       flag;
                uint8_t   mac[6];
                uint32_t  last_seen;
                char      op_id[ID_SIZE];
                char      uav_id[ID_SIZE];
                double    lat_d, long_d, base_lat_d, base_long_d;
                int       altitude_msl, height_agl, speed, heading, rssi;
};


//

static void               print_json(int,int,struct id_data *);
static esp_err_t          event_handler(void *,system_event_t *);
static void               callback(void *,wifi_promiscuous_pkt_type_t);
static struct id_data    *next_uav(uint8_t *);
static void               parse_odid(struct id_data *,ODID_UAS_Data *);
                        
static void               dump_frame(uint8_t *,int);
static void               calc_m_per_deg(double,double,double *,double *);
static char              *format_op_id(char *);

static double             base_lat_d = 0.0, base_long_d = 0.0, m_deg_lat = 110000.0, m_deg_long = 110000.0;

volatile char             ssid[10];
volatile unsigned int     callback_counter = 0, french_wifi = 0, odid_wifi = 0, odid_ble = 0;
volatile struct id_data   uavs[MAX_UAVS + 1];

volatile ODID_UAS_Data    UAS_data;

//

static const char        *title = "RID Scanner", *build_date = __DATE__,
                         *blank_latlong = " ---.------";





void setup() {

  int         i;
  char        text[128];

  text[0] = i = 0;

  //

  memset((void *) &UAS_data,0,sizeof(ODID_UAS_Data));
  memset((void *) uavs,0,(MAX_UAVS + 1) * sizeof(struct id_data));
  memset((void *) ssid,0,10);
  strcpy((char *) uavs[MAX_UAVS].op_id,"NONE");

  //

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
  
  // The channel should be 6.
  esp_wifi_set_channel(6,WIFI_SECOND_CHAN_NONE);
#endif


#if MAX_UAVS != 8
#warning "Align MAX_UAVS and colour assignments."
#endif


#if 0

  const char *id[3] = {"OP-12345678901234567890", "GBR-OP-123456789012", "GBR-OP-12345678901234567890"};

  for (i = 0; i < 3; ++i) {

    sprintf(text,"\'%s\' -> \'%s\'\r\n",(char *) id[i],format_op_id((char *) id[i]));
    Serial.print(text);
  }

#endif

  Serial.print("{ \"message\": \"setup() complete\" }\r\n");

  return;
}





void loop() {

  int             i, j, k, msl, agl;
  char            text[256];
  double          x_m = 0.0, y_m = 0.0;
  uint32_t        msecs, secs;
  static int      display_uav = 0;
  static uint32_t last_display_update = 0, last_page_change = 0, last_json = 0;


  text[0] = i = j = k = 0;

  //

  msecs = millis();
  secs  = msecs / 1000;

  for (i = 0; i < MAX_UAVS; ++i) {

    if ((uavs[i].last_seen)&&
        ((msecs - uavs[i].last_seen) > 300000L)) {

      uavs[i].last_seen = 0;
      uavs[i].mac[0]    = 0;

    }

    if (uavs[i].flag) {

      print_json(i,secs,(id_data *) &uavs[i]);

      if ((uavs[i].lat_d)&&(uavs[i].base_lat_d)) 
            // Imprimir a variável lat_d
        if (base_lat_d == 0.0) {

          base_lat_d  = uavs[i].base_lat_d;
          base_long_d = uavs[i].base_long_d;

          calc_m_per_deg(base_lat_d,base_long_d,&m_deg_lat,&m_deg_long);
        }

        y_m = (uavs[i].lat_d  - base_lat_d)  * m_deg_lat;
        x_m = (uavs[i].long_d - base_long_d) * m_deg_long;


      }

      uavs[i].flag = 0;

      last_json = msecs;
    }
  if ((msecs - last_json) > 1500000UL) { // Keep the serial link active

      print_json(MAX_UAVS,msecs / 1000,(id_data *) &uavs[MAX_UAVS]); 

      last_json = msecs;
  }
}



esp_err_t event_handler(void *ctx, system_event_t *event) {
  
  return ESP_OK;
}





void callback(void* buffer,wifi_promiscuous_pkt_type_t type) {

  int                     length, typ, len, i, j, offset;
  char                    ssid_tmp[10], *a;
  uint8_t                *packet_u8, *payload, *val;
  wifi_promiscuous_pkt_t *packet;
  struct id_data         *UAV = NULL;
  static uint8_t          mac[6], nan_dest[6] = {0x51, 0x6f, 0x9a, 0x01, 0x00, 0x00};

  a = NULL;
  
//

  ++callback_counter;

  memset(ssid_tmp,0,10);

  packet    = (wifi_promiscuous_pkt_t *) buffer;
  packet_u8 = (uint8_t *) buffer;
  
  payload   = packet->payload;
  length    = packet->rx_ctrl.sig_len;
  offset    = 36;

  UAV = next_uav(&payload[10]);

  memcpy(UAV->mac,&payload[10],6);

  UAV->rssi      = packet->rx_ctrl.rssi;
  UAV->last_seen = millis();

if (payload[0] == 0x80) { // beacon

    offset = 36;


    while (offset < length) {

      typ =  payload[offset];
      len =  payload[offset + 1];
      val = &payload[offset + 2];

      

       if ((typ      == 0xdd)&&
                 (((val[0] == 0x90)&&(val[1] == 0x3a)&&(val[2] == 0xe6))|| // Parrot
                  ((val[0] == 0xfa)&&(val[1] == 0x0b)&&(val[2] == 0xbc)))) { // ODID

        ++odid_wifi;
       
        if ((j = offset + 7) < length) {

          memset((void *) &UAS_data,0,sizeof(UAS_data));
   
          odid_message_process_pack((ODID_UAS_Data *) &UAS_data,&payload[j],length - j);
          parse_odid(UAV,(ODID_UAS_Data *) &UAS_data);
        }

      } else if ((typ == 0)&&(!ssid_tmp[0])) {

        for (i = 0; (i < 8)&&(i < len); ++i) {

          ssid_tmp[i] = val[i];
        }
      }

      offset += len + 2;
    }

  }



void parse_odid(struct id_data *UAV,ODID_UAS_Data *UAS_data2) {

  if (UAS_data2->BasicIDValid[0]) {

    UAV->flag = 1;
    strncpy((char *) UAV->uav_id,(char *) UAS_data2->BasicID[0].UASID,ODID_ID_SIZE);
  }

  if (UAS_data2->OperatorIDValid) {

    UAV->flag = 1;
    strncpy((char *) UAV->op_id,(char *) UAS_data2->OperatorID.OperatorId,ODID_ID_SIZE);
  }

  if (UAS_data2->LocationValid) {

    UAV->flag         = 1;
    UAV->lat_d        = UAS_data2->Location.Latitude;
    UAV->long_d       = UAS_data2->Location.Longitude;
    UAV->altitude_msl = (int) UAS_data2->Location.AltitudeGeo;
    UAV->height_agl   = (int) UAS_data2->Location.Height;
    UAV->speed        = (int) UAS_data2->Location.SpeedHorizontal;
    UAV->heading      = (int) UAS_data2->Location.Direction;
  }

  if (UAS_data2->SystemValid) {

    UAV->flag        = 1;
    UAV->base_lat_d  = UAS_data2->System.OperatorLatitude;
    UAV->base_long_d = UAS_data2->System.OperatorLongitude;
  }  

  return;
}
  
