#!/bin/bash

# error_count.sh 
# Autor: Manuel Irineu.
# Versão:1.0
# Descrição:Faz a leitura dos logs e mostra os discos com erros.
# Considerações:Ajuste a PATH da pasta onde contém os logs do smartctl.

# Define a pasta onde estão os resultados do smartctl.
result_dir="/home/mdotti/smart_test"

# Verifica se a pasta existe.
if [ ! -d "$result_dir" ]; then
  echo "A pasta $result_dir não existe."
  exit 1
fi

# Fal um Loop através de todos os arquivos na pasta.
for file in "$result_dir"/*; do
  # Verifica se o arquivo é um arquivo regular.
  if [ -f "$file" ]; then
    echo "Processando arquivo: $file"
    # Extrai e exibe a seção de erros do ATA Error Count.
    grep -A10 "ATA Error Count" "$file" | grep -E "Error|Error Count" | sed 's/^/  /'
  fi
done
