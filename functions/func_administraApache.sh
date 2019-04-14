#!/bin/bash
function compruebaEstado {
        estado=`systemctl status apache2.service | grep "Active:" | cut -d : -f 2 | cut -d " " -f 2`
}

#Coge el color según su estado
function mensajeEstado {
        mensaje="\e[7mEstado del Apache:\e[0m"
        if [ $estado == "active" ]
        then
                mensaje+="\e[$colorActivo Activo!\e[0m"
        else
                mensaje+="\e[$colorParado Parado!\e[0m"
        fi
}

