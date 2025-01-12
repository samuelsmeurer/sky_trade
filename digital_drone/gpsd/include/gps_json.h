/* gps_json.h - JSON handling for libgps and gpsd
 *
 * By Eric S. Raymond, 2009
 * This file is Copyright 2009 by the GPSD project
 * SPDX-License-Identifier: BSD-2-clause
 */

#include "json.h"

#ifdef __cplusplus
extern "C" {
#endif

struct gps_device_t;

void json_data_report(const gps_mask_t, struct gps_device_t *,
                      const struct gps_policy_t *, char *, size_t);
char *json_stringify(char *, size_t, const char *);
void json_tpv_dump(const gps_mask_t, struct gps_device_t *,
                   const struct gps_policy_t *, char *, size_t);
void json_noise_dump(const struct gps_data_t *, char *, size_t);
void json_raw_dump(const struct gps_data_t *, char *, size_t);
void json_sky_dump(const struct gps_data_t *, char *, size_t);
void json_att_dump(const struct gps_data_t *, char *, size_t,
                   const struct attitude_t *, const char *);
void json_oscillator_dump(const struct gps_data_t *, char *, size_t);
void json_subframe_dump(const struct gps_data_t *, const bool scaled, char buf[], size_t);
void json_device_dump(const struct gps_device_t *, char *, size_t);
void json_watch_dump(const struct gps_policy_t *, char *, size_t);
int json_watch_read(const char *, struct gps_policy_t *,
                    const char **);
char *json_policy_to_watch(struct gps_policy_t *ccp,
                           char *outbuf, size_t outbuf_len);
int json_device_read(const char *, struct devconfig_t *,
                     const char **);
void json_version_dump(char *, size_t);
void json_aivdm_dump(const struct ais_t *, const char *, bool,
                     char *, size_t);
int json_rtcm2_read(const char *, char *, size_t, struct rtcm2_t *,
                    const char **);
int json_rtcm3_read(const char *, char *, size_t, struct rtcm3_t *,
                    const char **);
int json_ais_read(const char *, char *, size_t, struct ais_t *,
                  const char **);
int libgps_json_unpack(const char *, struct gps_data_t *,
                       const char **);
#ifdef __cplusplus
}
#endif

// these values don't matter in themselves, they just have to be out-of-band
#define DEVDEFAULT_BPS          0
#define DEVDEFAULT_PARITY       'X'
#define DEVDEFAULT_STOPBITS     3
#define DEVDEFAULT_NATIVE       -1

// gps_json.h ends here
// vim: set expandtab shiftwidth=4
