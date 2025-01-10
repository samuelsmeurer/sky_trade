import asyncio
from bleak import BleakScanner

# Scan BLE devices
async def scan_ble_devices():
    print("Initializing BLE scan...")
    
    # Scan for 5 seconds
    devices = await BleakScanner.discover(timeout=5)
    
    # Check if any device was found
    if devices:
        print(f"BLE devices found: {len(devices)}")
        # Print device information
        for device in devices:
            name = device.name if device.name else "(unknown)"
            address = device.address
            rssi = device.rssi
            print(f"Name: {name}, Address: {address}, RSSI: {rssi}")
    else:
        print("No BLE devices found.")

# The main function for scanning
def main():
    asyncio.run(scan_ble_devices())

if __name__ == "__main__":
    main()
