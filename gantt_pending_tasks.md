Report on Pending Tasks for the Remote ID Receiver Code
1. Test the Code with Drones (DJI Mini 3)
Objective: Verify if the DJI Mini 3 transmits Remote ID data via UDP Broadcast, BLE, or Wi-Fi that can be captured by the current code.
Action:
Run the receiver code with the DJI Mini 3 powered on and monitor if the drone transmits Remote ID information such as UUID, location, altitude, etc.
Identify if the data transmitted by the DJI Mini 3 follows the ASTM F3411-19 standard or uses a proprietary format.
Document the captured information and check if the transmitted data matches what the code is able to capture.
Status: Pending

2. Add Support for Wi-Fi and BLE in the Receiver Code
Objective: Complete the receiver code with Wi-Fi (besides UDP Broadcast) and BLE capture methods.
Action:
Wi-Fi (TCP/UDP): In addition to UDP Broadcast, implement the ability to capture packets via Direct Wi-Fi (TCP/UDP) for drones that can transmit data directly.
BLE (Bluetooth Low Energy): Add a function to scan nearby BLE devices, capture, and decode Remote ID packets transmitted via BLE.
Test with the DJI Mini 3, which supports BLE for Remote ID.
Adjust the code to scan for specific UUIDs and Remote ID data such as location and drone status.
Status: Pending

3. Check Common Cryptography and How to Decode It
Objective: Identify if Remote ID data transmitted by the DJI Mini 3 or other drones is encrypted, and if so, study how to decode those packets.
Action:
Verify DJI Protocol: DJI may use encryption to transmit flight and Remote ID data. We need to verify if the captured packets are readable or encrypted.
Study Cryptography: Identify common cryptographic methods used in drone transmissions (AES, TLS, etc.).
Decoding: If the packets are encrypted, investigate whether there are APIs or libraries available to decode the information or capture the packets before encryption.
Consult DJI Documentation: Check the DJI Mini 3's technical documentation to understand if the drone uses encryption for Remote ID and how the encryption keys are exchanged, if applicable.
Status: Pending

4. Port the Code to MicroPython or C++ to Run on an ESP32
Objective: Migrate the receiver code to MicroPython or C++ to run efficiently on an ESP32.
Action:
MicroPython: If opting for MicroPython, check if the installed version on the ESP32 supports BLE scanning, UDP Broadcast listening, and TCP/IP over Wi-Fi.
Verify available BLE libraries for MicroPython (support is more limited compared to bleak in Python).
Test compatibility and stability when running on a resource-constrained device like the ESP32.
C++ (Arduino or ESP-IDF): Alternatively, implement the code in C++ using the Arduino framework or ESP-IDF, which fully supports Wi-Fi and BLE on the ESP32.
Add support for UDP broadcast, Wi-Fi, and BLE.
Use the BLE Scanner available in ESP-IDF to detect BLE devices and capture Remote ID packets.
Implement sockets for Wi-Fi and UDP broadcast on the ESP32, which has full support for these functionalities.
Status: Pending

5. Specific Considerations for the ESP32
Additional actions required for the ESP32:

BLE Limitations in MicroPython: If using MicroPython, there may be limited support for BLE. The code may need to be adjusted to fit the memory and functional constraints of the ESP32, or you may opt for C++ (with the Arduino or ESP-IDF frameworks) for more efficient control of BLE.

Simultaneous Wi-Fi and BLE Connectivity: The ESP32 may encounter issues when using Wi-Fi and BLE simultaneously due to hardware limitations. Test the stability when using both Wi-Fi for UDP/TCP and BLE and adjust the code to ensure communication does not degrade.

Performance and Power Consumption: Verify that the code runs efficiently on the ESP32 without consuming too much processing power and battery. This could be crucial if the receiver is used in a mobile or autonomous device.

Status: Pending

6. UUID and Coordinates of the Drone and Operator
Objective: Verify if the captured Remote ID packets contain the correct information, including UUID, drone coordinates, and, if available, the operator’s location.
Action:
Verify if the UUID is unique and correctly identifies the drone.
Test if the coordinates (latitude, longitude) received from the drone match the real-world location (this can be done using GPS apps on the drone controller).
Operator’s Location: If the DJI Mini 3 transmits the operator’s (pilot’s) location, check if this information is accurate and can be captured by the receiver code.
Status: Verification Pending