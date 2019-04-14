#!/bin/bash
set -e
source ./functions/func_adminSitesApache.sh
source ./functions/func_error.sh
while :
do
	echo "Indica l'acció a realitzar:"
	echo " [1] Afegir directiva"
	echo " [2] Modificar directiva"
	echo " [3] Eliminar directiva"
	echo " [S] Sortir"
	read opcio
	case $opcio in
		1)
		mostrarConf
		afegir;;
		2)
		mostrarConf
		modifica;;
		3)
		mostrarConf
		elimina;;
		"s"|"S")exit;;
		*)echo $errorMenu;;
	esac
done
