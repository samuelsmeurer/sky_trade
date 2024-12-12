/* -*- tab-width: 2; mode: c; -*-
 * 
 * Scanner for WiFi direct remote id. 
 * 
 * Copyright (c) 2020-2021, Steve Jack.
 *
 * MIT licence.

 */

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


/*
 *
 */

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

/*
 *
 */

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

  



  if ((msecs - last_json) > 60000UL) { // Keep the serial link active

      print_json(MAX_UAVS,msecs / 1000,(id_data *) &uavs[MAX_UAVS]); 

      last_json = msecs;
  }
}
  //


/*
 *
 */

void print_json(int index,int secs,struct id_data *UAV) {

  char text[128], text1[16],text2[16], text3[16], text4[16];

  dtostrf(UAV->lat_d,11,6,text1);
  dtostrf(UAV->long_d,11,6,text2);
  dtostrf(UAV->base_lat_d,11,6,text3);
  dtostrf(UAV->base_long_d,11,6,text4);

  sprintf(text,"{ \"index\": %d, \"runtime\": %d, \"mac\": \"%02x:%02x:%02x:%02x:%02x:%02x\", ",
          index,secs,
          UAV->mac[0],UAV->mac[1],UAV->mac[2],UAV->mac[3],UAV->mac[4],UAV->mac[5]);
  Serial.print(text);
  sprintf(text,"\"id\": \"%s\", \"uav latitude\": %s, \"uav longitude\": %s, \"alitude msl\": %d, ",
          UAV->op_id,text1,text2,UAV->altitude_msl);
    (text);
  sprintf(text,"\"height agl\": %d, \"base latitude\": %s, \"base longitude\": %s, \"speed\": %d, \"heading\": %d }\r\n",
          UAV->height_agl,text3,text4,UAV->speed,UAV->heading);
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
  

    int rssi = packet->rx_ctrl.rssi;      // Intensidade do sinal

    // Imprime informações básicas do pacote
    Serial.print("Pacote capturado: Comprimento = ");
    Serial.print(length);
    Serial.print(" bytes, RSSI = ");
    Serial.println(rssi);

// Imprime mais bytes do payload para análise detalhada
Serial.print("Payload: ");
for (int i = 0; i < length; i++) {  // Ajuste 'length' para limitar a saída se necessário
    Serial.printf("%02X ", payload[i]);
    if ((i+1) % 16 == 0) Serial.println();
}
Serial.println();


  UAV = next_uav(&payload[10]);

  memcpy(UAV->mac,&payload[10],6);

  UAV->rssi      = packet->rx_ctrl.rssi;
  UAV->last_seen = millis();

//

  if (memcmp(nan_dest,&payload[4],6) == 0) {

    // dump_frame(payload,length);

    if (odid_wifi_receive_message_pack_nan_action_frame((ODID_UAS_Data *) &UAS_data,(char *) mac,payload,length) == 0) {

      ++odid_wifi;

      parse_odid(UAV,(ODID_UAS_Data *) &UAS_data);
    }

  } else if (payload[0] == 0x80) { // beacon

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

    if (ssid_tmp[0]) {

      strncpy((char *) ssid,ssid_tmp,8);
    }
#if 0
  } else if (a = (char *) memchr(payload,'G',length)) {

    if (memcmp(a,"GBR-OP-",7) == 0) {

      dump_frame(payload,length);     
    }
#endif
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


/*
 *
 */

void calc_m_per_deg(double lat_d,double long_d,double *m_deg_lat,double *m_deg_long) {

  double pi, deg2rad, sin_lat, cos_lat, a, b, radius;

  pi       = 4.0 * atan(1.0);
  deg2rad  = pi / 180.0;

  sin_lat     = sin(lat_d * deg2rad);
  cos_lat     = cos(lat_d * deg2rad);
  a           = 0.08181922;
  b           = a * sin_lat;
  radius      = 6378137.0 * cos_lat / sqrt(1.0 - (b * b));
  *m_deg_long = deg2rad * radius;
  *m_deg_lat   = 111132.954 - (559.822 * cos(2.0 * lat_d * deg2rad)) - 
                (1.175 *  cos(4.0 * lat_d * deg2rad));

  return;
}
