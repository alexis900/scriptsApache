#!/bin/bash
set -e
source ./functions/func_administraApache.sh
source ./functions/func_error.sh
while :
do
	compruebaEstado
		if [ $estado == "active" ]
		then
			echo "Administración del servidor web Apache"
 	 		mensajeEstado
        		echo -e $mensaje
        		echo "Indica la acción que deseas realitzar"
        		echo " [1] Restart"
        		echo " [2] Reload"
        		echo " [3] Stop"
        		echo " [S] Salir del script"
        		read opcion
        		case $opcion in
                		1) systemctl restart apache2.service
                		clear;;
                		2) systemctl reload apache2.service
                		clear;;
                		3) systemctl stop apache2.service
                		clear;;
                		"S"|"s")exit;;
                		*)clear 
                		echo $errorMenu;;
       		esac

		else
			echo "Administración del servidor web Apache"
        		mensajeEstado
        		echo -e $mensaje
        		echo "Indica la acción que deseas realitzar"
        		echo " [1] Start"
        		echo " [S] Salir del script"
        		read opcion
        		case $opcion in
                		1) systemctl start apache2.service
               			clear;;
                		"S"|"s")exit;;
                		*) clear
                		echo $errorMenu;;
        		esac
	fi
done
