#!/bin/bash
set -e
clear
source ./functions/func_error.sh
if [[ ! -f var.conf || -z var.conf ]]
then
echo 'export errorMenu="Introdueix una opció del menú correcta!"
export ruta=/etc/apache2
export colorActivo=42m
export colorParado=101m
export custLog=miScript.log
export logErr=miScript.err
export data=$(date "+%d/%m/%Y %H:%M:%S")' > var.conf
fi

source ./var.conf

while :
do	
	echo "Gestió del servidor Apache"
	echo " [1] Administrar el servidor"
	echo " [2] Administrar mòduls"
	echo " [3] Administrar llocs"
	echo " [4] Configuració"
	echo " [S] Sortir"
	read opcio
	case $opcio in
		1) clear 
		./administraApache.sh ;;
		2) clear 
		./administraModuls.sh ;;
		3) clear 
		./sitesApache.sh ;;
		4) ./conf.sh ;;
		"s"|"S")exit;;
		*) clear
		echo $errorMenu;;
	esac
done
