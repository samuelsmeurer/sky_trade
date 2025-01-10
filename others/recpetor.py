import socket
import json
import time

def listen_for_packets():
    """Listen for broadcast packets on the same address and port."""
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.bind(('', 37020))  # Same port used by the drone script

    print("Listening for Remote ID packets...")

    identified_drones = {}

    while True:
        data, addr = sock.recvfrom(1024)  # Maximum packet size
        try:
            packet = json.loads(data.decode())  # Try to decode the packet as JSON
            drone_id = packet['drone_id']
            latitude = packet['latitude']
            longitude = packet['longitude']
            altitude = packet['altitude']
            speed = packet['speed']
            direction = packet['direction']
            status = packet['status']

            # Display the received drone data
            print(f"\nDrone identified from {addr}:")
            print(f"ID: {drone_id}")
            print(f"Location: {latitude}, {longitude}")
            print(f"Altitude: {altitude}m, Speed: {speed}m/s, Direction: {direction}°")
            print(f"Status: {status}")

            # Update the list of identified drones
            identified_drones[drone_id] = {
                'location': (latitude, longitude),
                'altitude': altitude,
                'speed': speed,
                'direction': direction,
                'status': status,
                'last_update': time.time()
            }

        except json.JSONDecodeError:
            print(f"Error decoding packet: {data.decode()}")

        # Remove drones that haven't sent data recently (30 seconds)
        current_time = time.time()
        identified_drones = {k: v for k, v in identified_drones.items() if current_time - v['last_update'] < 30}

        # Display the list of currently identified drones
        print("\nActive drones:")
        for drone_id, info in identified_drones.items():
            print(f"- {drone_id}: Location {info['location']}, Altitude {info['altitude']}m")

if __name__ == "__main__":
    listen_for_packets()
