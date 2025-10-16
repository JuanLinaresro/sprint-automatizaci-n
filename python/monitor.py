import psutil
import time
import os
from datetime import datetime

# Crear carpeta de logs si no existe
LOG_DIR = os.path.join(os.path.dirname(__file__), "..", "logs")
LOG_FILE = os.path.join(LOG_DIR, "monitor_log.txt")
os.makedirs(LOG_DIR, exist_ok=True)

def registrar_datos():
    """Obtiene datos del sistema y los guarda en el log."""
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    cpu = psutil.cpu_percent(interval=1)
    ram = psutil.virtual_memory()
    total_ram = round(ram.total / (1024 ** 3), 2)
    usada_ram = round(ram.used / (1024 ** 3), 2)
    libre_ram = round(ram.available / (1024 ** 3), 2)
    procesos = len(psutil.pids())

    datos = (
        f"[{timestamp}] CPU: {cpu}% | RAM usada: {usada_ram} GB / {total_ram} GB "
        f"({libre_ram} GB libre) | Procesos activos: {procesos}\n"
    )

    print(datos.strip())

    with open(LOG_FILE, "a") as f:
        f.write(datos)

if __name__ == "__main__":
    print("=== MONITOR DEL SISTEMA ===")
    registrar_datos()
    opcion = input("¿Deseas registrar 10 lecturas automáticas cada 5 segundos? (s/n): ").lower()
    if opcion == "s":
        for i in range(10):
            registrar_datos()
            time.sleep(5)
