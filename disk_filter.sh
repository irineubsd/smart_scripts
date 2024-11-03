#!/bin/bash

# disk_filter.sh 
# Autor: Manuel Irineu.
# Versão:1.0
# Descrição:Lista os discos do ZBoox e filtra por TiB e devolve a PATH.

# Captura a saída do comando fdisk -l filtrando apenas linhas com TiB.
output=$(fdisk -l | grep TiB)

# Usa awk para extrair apenas a PATH /dev/sdX e ordena alfabeticamente.
devices=$(echo "$output" | awk '{print $2}' | sort)

# Imprime as PATH /dev/sdX 
echo "$devices"
