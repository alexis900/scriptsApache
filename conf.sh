#!/bin/bash
source ./functions/func_conf.sh
while :
do
echo "Menú de configuració de l'Script"
echo " [1] Ruta de l'Apache2"
echo " [2] Ruta del fitxer de logs"
echo " [3] Ruta del fitxer d'errors"
echo " [S] Sortir"

read opcion
	case $opcion in
		1)rutaApache
		clear;;
		2)rutaLog
		clear;;
		3) rutaLogError
		clear;;
		"S"|"s") exit
		clear;;
		*)clear
		echo $errorMenu;;
	esac
done
