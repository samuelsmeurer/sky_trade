#include <Arduino.h>
#include "opendroneid.h"

// Variáveis globais
ODID_UAS_Data uasData; // Estrutura para armazenar dados ODID

// Payload fixo de exemplo
const char* payload_hex =
    "80 00 00 00 FF FF FF FF FF FF 98 83 89 D0 C0 91 "
    "98 83 89 D0 C0 91 00 64 87 61 08 47 00 00 00 00 "
    "C8 00 11 04 00 0B 44 72 6F 6E 65 49 44 54 65 73 "
    "74 01 08 82 84 8B 96 0C 12 18 24 03 01 06 05 04 "
    "01 02 00 00 2A 01 04 32 04 30 48 60 6C 30 14 01 "
    "00 00 0F AC 04 01 00 00 0F AC 04 01 00 00 0F AC "
    "02 00 00 3B 02 51 00 7F 08 04 00 00 00 00 00 00 "
    "40 DD E9 FA 0B BC 0D 00 F2 19 09 02 12 31 31 32 "
    "36 32 34 31 35 30 41 39 30 45 33 41 45 31 45 43 "
    "30 00 00 00 02 42 46 44 33 34 35 34 42 37 37 38 "
    "E5 36 35 43 32 34 42 37 30 00 00 00 12 26 B5 00 "
    "00 58 16 AF 1E 38 CD FF FF 98 08 AC 08 70 08 4A "
    "63 15 0E 01 00 22 10 02 3F 00 3F AB 01 31 32 33 "
    "34 35 36 37 38 39 30 31 32 33 34 35 36 37 22 11 "
    "31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 "
    "37 38 39 30 31 32 33 22 12 31 32 33 34 35 36 37 "
    "38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 "
    "32 00 44 72 6F 6E 65 20 49 44 20 74 65 73 74 20 "
    "66 6C 69 67 68 74 2D 2D 2D 42 04 10 27 00 00 F0 "
    "D8 FF FF 01 00 00 D0 07 D0 07 12 F9 07 D5 1C AC "
    "01 00 52 00 46 49 4E 38 37 61 73 74 72 64 67 65 "
    "31 32 6B 38 00 00 00 00 AC 01 00 78 56 AD BA";

// Função para converter string hexadecimal em array de bytes
void hexStringToByteArray(const char* hexString, uint8_t* byteArray, int byteArraySize) {
    for (int i = 0; i < byteArraySize; i++) {
        sscanf(hexString + 2 * i, "%2hhx", &byteArray[i]);
    }
}

// Função para processar o payload e exibir os dados decodificados
void processPayload() {
    int byteArraySize = strlen(payload_hex) / 3 + 1; // Cada byte ocupa 2 caracteres + 1 espaço
    uint8_t byteArray[byteArraySize];
    
    hexStringToByteArray(payload_hex, byteArray, byteArraySize);

    // Inicializa a estrutura para armazenar os dados decodificados
    memset(&uasData, 0, sizeof(ODID_UAS_Data));

    // Procurando pelo padrão FA 0B BC após DD
    for (int i = 0; i < byteArraySize; i++) {
        if (byteArray[i] == 0xDD) {
            if (i + 3 < byteArraySize && byteArray[i + 1] == 0xFA && byteArray[i + 2] == 0x0B && byteArray[i + 3] == 0xBC) {
                Serial.println("Encontrado ODID no payload!");

                // Chama a função de processamento com a posição ajustada
                odid_message_process_pack(&uasData, &byteArray[i + 7], byteArraySize - (i + 7));

                // Exibe os dados decodificados
                if (uasData.BasicIDValid[0]) {
                    Serial.print("ID Básico: ");
                    Serial.println((char*)uasData.BasicID[0].UASID);
                }

                if (uasData.LocationValid) {
                    Serial.print("Localização: Latitude = ");
                    Serial.print(uasData.Location.Latitude, 6);
                    Serial.print(", Longitude = ");
                    Serial.print(uasData.Location.Longitude, 6);
                    Serial.print(", Altitude = ");
                    Serial.println(uasData.Location.AltitudeGeo, 2);
                }

                if (uasData.OperatorIDValid) {
                    Serial.print("ID do Operador: ");
                    Serial.println((char*)uasData.OperatorID.OperatorId);
                }
                return; // Encerrar após encontrar e processar o ODID
            }
        }
    }

    Serial.println("ODID não encontrado no payload.");
}

void setup() {
    // Inicializações
    Serial.begin(115200);
    delay(1000); // Aguardar inicialização do Serial
    Serial.println("ESP32 iniciado!");

    // Processa o payload na inicialização
    processPayload();
}

void loop() {
    // Não há lógica contínua, mas podemos adicionar
    delay(1000); // Evitar repetição desnecessária
}
