#!/bin/bash

# shellcheck disable = code # code is irrelevant because reasons     

./reset.sh

domain=$1
echo "Escaneando $domain"

timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
ruta_resultados=./resultados/$domain/$timestamp

mkdir -p "$ruta_resultados"
mkdir -p "$ruta_resultados/raw"
mkdir -p "$ruta_resultados/clean"

dig +short A $domain > $ruta_resultados/clean/A.txt
dig +short MX $domain > $ruta_resultados/clean/MX.txt
dig +short TXT $domain > $ruta_resultados/clean/TXT.txt
dig +short NS $domain > $ruta_resultados/clean/NS.txt
dig +short SRV $domain > $ruta_resultados/clean/SRV.txt


echo "Monstrando A.txt"
echo ""
cat $ruta_resultados/clean/A.txt
echo ""

echo "Monstrando MX.txt"
echo ""
cat $ruta_resultados/clean/MX.txt
echo ""

echo "Monstrando TXT.txt"
echo ""
cat $ruta_resultados/clean/TXT.txt
echo ""

echo "Monstrando NS.txt"
echo ""
cat $ruta_resultados/clean/NS.txt
echo ""

echo "Monstrando SRV.txt"
echo ""
cat $ruta_resultados/clean/SRV.txt
echo ""

