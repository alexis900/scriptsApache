#!/bin/bash
set -e
source ./functions/func_administraModuls.sh
source ./functions/func_error.sh

mod=$(ls "$ruta"/mods-available/ | grep .load | cut -d . -f 1)
while :
do	
	llistaModul
	echo "Indica l'acció a realitzar"
	echo " [1] Llistar mòduls"
	echo " [2] Activar mòdul"
	echo " [3] Desactivar mòdul"
	echo " [S] Sortir"
	read opcio
	case $opcio in
	1)echo -e $listaConColor;;
	2)activaModul;;
	3)desactivaModul;;
	"s"|"S")exit;;
	*)echo $errorMenu;;
	esac
done

