import serial

def read_from_usb():
    # Configurar el puerto serial
    ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)
    ser.flush()

    while True:
        if ser.in_waiting > 0:
            data = ser.read(2)  # Leer 2 bytes
            value = int.from_bytes(data, byteorder='little')
            print(f"Valor de memoria recibido: {value}")

if __name__ == "__main__":
    read_from_usb()