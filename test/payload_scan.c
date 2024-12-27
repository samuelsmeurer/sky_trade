#include <pcap.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>

#define SNAP_LEN 1518

pcap_t *handle;

void packet_handler(u_char *args, const struct pcap_pkthdr *header, const u_char *packet) {
    FILE *log_file = (FILE *)args;
    int data_start = 42; // Assume que o payload começa após 42 bytes (Ethernet + IP + TCP)

    if (header->caplen > data_start) {
        int data_length = header->caplen - data_start;
        fprintf(log_file, "Packet size: %d bytes\n", data_length);
        fprintf(log_file, "Payload:\n");

        for (int i = data_start; i < header->caplen; ++i) {
            fprintf(log_file, "%02x ", packet[i]);
            if ((i - data_start + 1) % 16 == 0) {
                fprintf(log_file, "\n");
            }
        }
        fprintf(log_file, "\n\n");
    }
}

void alarm_handler(int signum) {
    pcap_breakloop(handle); // Interrompe a captura de pacotes
}

int main() {
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_if_t *alldevs, *device;
    struct bpf_program fp;
    bpf_u_int32 mask;
    bpf_u_int32 net;
    char *dev_name;

    // Configura o alarme
    signal(SIGALRM, alarm_handler);
    alarm(30); // Configura o alarme para disparar após 30 segundos

    if (pcap_findalldevs(&alldevs, errbuf) == -1) {
        fprintf(stderr, "Couldn't find devices: %s\n", errbuf);
        exit(EXIT_FAILURE);
    }

    device = alldevs;
    if (device == NULL) {
        printf("No devices found.\n");
        return -1;
    }
    dev_name = device->name;

    if (pcap_lookupnet(dev_name, &net, &mask, errbuf) == -1) {
        fprintf(stderr, "Couldn't get netmask for device %s: %s\n", dev_name, errbuf);
        net = 0;
        mask = 0;
    }

    handle = pcap_open_live(dev_name, SNAP_LEN, 1, 1000, errbuf);
    if (handle == NULL) {
        fprintf(stderr, "Couldn't open device %s: %s\n", dev_name, errbuf);
        exit(EXIT_FAILURE);
    }

    if (pcap_compile(handle, &fp, "ip", 0, net) == -1) {
        fprintf(stderr, "Couldn't parse filter ip: %s\n", pcap_geterr(handle));
        exit(EXIT_FAILURE);
    }

    if (pcap_setfilter(handle, &fp) == -1) {
        fprintf(stderr, "Couldn't install filter ip: %s\n", pcap_geterr(handle));
        exit(EXIT_FAILURE);
    }

    FILE *log_file = fopen("payloads.txt", "w");
    if (log_file == NULL) {
        perror("File opening failed");
        return -1;
    }

    pcap_loop(handle, 0, packet_handler, (u_char *)log_file); // 0 para pacotes infinitos até que seja interrompido

    fclose(log_file);
    pcap_freecode(&fp);
    pcap_close(handle);
    pcap_freealldevs(alldevs);

    printf("Capture complete. Payloads saved to 'payloads.txt'.\n");
    return 0;
}
