<p align="right">
  <img src="../others/images/16image.png" alt="SkyTrade" width="200" style="float: right;">
</p>

# Digital Drone
This software sends drone ID data via Wi-Fi Beacon on a desktop Linux PC or Raspberry Pi.

**Root repository:** [https://github.com/opendroneid/transmitter-linux/tree/main](https://github.com/opendroneid/transmitter-linux/tree/main)

The purpose of using this repository at Sky Trade is for testing and simulations when there is no access to a physical drone that can send data via remote ID to test the radar.

## How to Start Sending Data Using the Remote ID Protocol via Wifi

Performing the transmission will disconnect the computer from any Wi-Fi network.

### First Step:
In the digital_drone root folder, execute the following command:
```bash
sudo hostapd/hostapd/hostapd beacon.conf
```

### Second Step:

After executing the command, open another terminal, navigate to the digital_drone/build folder, and run the command:
```
sudo ./transmit b p
```

After both terminals are open and running the commands, the radar will be able to capture the transmitted information.

**Note:** Sometimes, the transmission fails, so it is recommended to restart the transmission by executing the two commands shown above.
