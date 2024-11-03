#!/bin/bash
# #######  ######    #####    #####   ###  ##           ##   ##  #####     #####    # #####  # #####  ###### #
# ##  ##    ##  ##  ### ###  ### ###  ###  ##           ### ###   ## ##   ### ###  ## ## ## ## ## ##    ## #
#    ##     ##  ##  ##   ##  ##   ##   #####            #######   ##  ##  ##   ##     ##       ##       ## #
#   ##      #####   ##   ##  ##   ##    ###             ## # ##   ##  ##  ##   ##     ##       ##       ## #
#  ##       ##  ##  ##   ##  ##   ##   #####            ##   ##   ##  ##  ##   ##     ##       ##       ## #
# ##   ##   ##  ##  ### ###  ### ###  ##  ###           ##   ##   ## ##   ### ###     ##       ##       ## #
# #######  ######    #####    #####   ##  ###           ### ###  #####     #####     ####     ####    ###### #

# smartctl_teste.sh 
# Autor:Manuel Irineu.
# Versão:1.0
# Descrição:Executa o smartctl -t long nos discos do zvol01.
# Considerações:Faz o teste do disco sdb até sdy. Ajustar conforme necessidade do ZBoox.

# Define o intervalo de letras dos discos do ZBoox.
start_letter="b"
end_letter="y"

# Converte letras em números ASCII para usar em um loop.
start_number=$(printf "%d" "'$start_letter")
end_number=$(printf "%d" "'$end_letter")

# Loop através de cada disco no intervalo especificado. 
for ((i=start_number; i<=end_number; i++)); do
  # Converter o número ASCII de volta para a letra correspondente.
  current_letter=$(printf "\\$(printf "%03o" "$i")")
  disk="/dev/sd$current_letter"

  echo "Iniciando teste longo SMART em $disk"

  # Executa o teste longo do SMART.
   smartctl -t long "$disk"

  echo "Teste longo iniciado em $disk"
done
