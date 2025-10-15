#!/bin/bash

# Script para eliminar archivos .log del proyecto

echo "Buscando archivos .log para eliminar..."

find . -type f -name "*.log" -exec rm -v {} \;

echo "Proceso completado."
