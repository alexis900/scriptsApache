#!/bin/bash
set -e
source ./functions/func_sitesApache.sh
source ./functions/func_error.sh
while :
do
llistaSites
echo "Administrador de llocs virtuals"
        echo " [1] Llistar llocs"
        echo " [2] Activar lloc"
        echo " [3] Desactivar lloc"
        echo " [4] Crear lloc"
        echo " [5] Modificar lloc"
        echo " [6] Eliminar lloc"
        echo " [S] Sortir de l'script"

	read opcio
	case $opcio in
		1) echo -e $listaConColor;;
		2) activaSite;;
		3) desactivaSite;;
		4) creaLloc;;
		5) clear
		./adminSitesApache.sh;;
		6) eliminaSite;;
		"s"|"S") exit;;
		*) echo $errorMenu;;
	esac
done
