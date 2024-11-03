#!/bin/bash

# smartctl_status.sh
# Autor:Manuel Irineu.
# Versão: 1.0
# Descrição:Executa o smartctl -a nos discos do zvol01 e salva a saída em arquivos de texto com a última letra do disco.
# Considerações:Faz a leitura dos logs do smart. Ajustar conforme necessidade.

# Definie o intervalo de letras dos discos do ZBoox.
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
        output_file="smartctl_${current_letter}.txt"

                echo "Verificando o status do SMART em $disk"

 # Executa o smartctl -a e salva as saídas em arquivos com a última letra do disco.
         smartctl -a "$disk" > "$output_file" 2>&1

                        echo "Status do SMART em $disk salvo em $output_file."
                done
