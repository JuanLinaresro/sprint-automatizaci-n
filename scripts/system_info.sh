#!/bin/bash

# ==========================================
# Script: system_info.sh
# Descripción: Genera un informe del sistema con datos reales:
#  - usuarios conectados
#  - uso de CPU / memoria
#  - espacio en disco
#  - últimos errores del sistema
# El informe se guarda en logs/system_report.txt
# ==========================================

# Determinar directorios (ajustar rutas relativas si es necesario)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Supone que logs está al mismo nivel que scripts/
LOG_DIR="${SCRIPT_DIR}/../logs"
LOG_FILE="${LOG_DIR}/system_report.txt"

# Crear carpeta de logs si no existe
mkdir -p "$LOG_DIR"

# Inicio del reporte
{
  echo "=========================================="
  echo "   REPORTE DEL SISTEMA - $(date)"
  echo "=========================================="
  echo ""

  # Usuarios conectados
  echo "USUARIOS CONECTADOS:"
  who
  echo ""

  # Uso de CPU / memoria (top)
  echo "USO DE CPU / MEMORIA (top -b -n1):"
  top -b -n1 | head -n 10
  echo ""

  echo "MEMORIA (free -h):"
  free -h
  echo ""

  # Espacio en disco
  echo "ESPACIO EN DISCO (df -h):"
  df -h
  echo ""

  # Últimos errores del sistema
  echo "ÚLTIMOS ERRORES DEL SISTEMA (dmesg | tail -10):"
  dmesg | tail -10
  echo ""

  echo "=========================================="
  echo " Fin del reporte - $(date)"
  echo "=========================================="
} > "$LOG_FILE"

echo "Reporte generado: $LOG_FILE"
