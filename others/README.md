<p align="right">
  <img src="images/16image.png" alt="SkyTrade" width="200" style="float: right;">
</p>

# Others Sky Trade
This folder contains various auxiliary scripts, process standardization images, and instructional images.

The main code in this folder is `payload_scan.c.

This code can be used by personnel who have access to a drone that sends remote ID via WiFi but do not have an ESP32. This code will execute and capture all WiFi packets in the 6GHz band and output them to the file `payloads.txt`.

These payloads can be used to optimize the radar for new drones.

## Step-by-Step Instructions for Running `payload_scan.c`

1. Turn on the drone and start a flight.
2. Ensure you are in the folder `sky_trade/others` and run the command for compilation:

```
gcc -o payload_scan payload_scan.c -lpcap
```

3. Execute the following command to run the program:
```
sudo ./payload_scan 
```

4. Send the file `payloads.txt` to the remote ID protocol analysis team for payloads.

