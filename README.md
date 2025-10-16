# sprint-automatizaci-n
Primer repositorio sprint
# 🧾 Proyecto: Reporte del Sistema

## 📌 Descripción

Este proyecto contiene un script en Bash que genera un **reporte automático del sistema Linux**.  
El script se encuentra en `scripts/system_info.sh` y produce un informe con datos reales de:

- Usuarios conectados (`who`)
- Uso de CPU y memoria (`top`, `free -h`)
- Espacio en disco (`df -h`)
- Últimos errores del sistema (`dmesg | tail -10`)

El resultado se guarda automáticamente en:



