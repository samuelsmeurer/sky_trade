import socket
import uuid
import random
import time
import json

def generate_drone_uuid():
    """Generates a unique identifier for the drone."""
    return str(uuid.uuid4())

def update_flight_data(latitude, longitude):
    """Updates the flight data of the drone, simulating changes in position."""
    latitude += random.uniform(-0.0001, 0.0001)
    longitude += random.uniform(-0.0001, 0.0001)
    altitude = random.uniform(0, 100)
    speed = random.uniform(0, 20)
    direction = random.uniform(0, 360)
    return latitude, longitude, altitude, speed, direction

def create_remote_id_packet(drone_id, latitude, longitude, altitude, speed, direction, status):
    """Creates a Remote ID data packet for transmission."""
    packet = {
        "drone_id": drone_id,
        "latitude": latitude,
        "longitude": longitude,
        "altitude": altitude,
        "speed": speed,
        "direction": direction,
        "status": status
    }
    return json.dumps(packet)  # Serializes the packet as JSON for transmission

def transmit_packet(packet):
    """Transmits the packet via broadcast using UDP."""
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.sendto(packet.encode(), ('<broadcast>', 37020))  # Arbitrary port
    sock.close()

def main():
    # Initialize the drone data
    drone_id = generate_drone_uuid()
    latitude = 0.0
    longitude = 0.0
    status = "grounded"  # Initial status of the drone

    while True:
        # Update flight data
        latitude, longitude, altitude, speed, direction = update_flight_data(latitude, longitude)

        # Create the Remote ID packet
        packet = create_remote_id_packet(drone_id, latitude, longitude, altitude, speed, direction, status)

        # Transmit the packet
        transmit_packet(packet)

        # Wait 1 second before sending the next packet
        time.sleep(1)

if __name__ == "__main__":
    main()
