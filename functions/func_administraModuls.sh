#!/bin/bash
#Lista los modulos que existen en el sistema
function llistaModul {
        listaConColor=""
        listaSinColor=""
        num=1
        for i in $mod
        do
                if [ -f $ruta/mods-enabled/$i.load ]
                then
                        listaConColor+="$num) $i\n"
                else
                        listaConColor+="\e[31m$num) $i\e[0m\n"
                fi
                listaSinColor+="$num $i\n"
                (( num++ ))
        done
}

function activaModul {
        read -p "Introdueix el número del mòdul " opcion
        act=$(echo -e $listaSinColor | grep $opcion | cut -d " " -f 2)
        a2enmod $act > /dev/null
        systemctl restart apache2
}

function desactivaModul {
        read -p "Introdueix el número del mòdul" opcion
        act=$(echo -e $listaSinColor | grep $opcion | cut -d " " -f 2)
        a2dismod $act > /dev/null
        systemctl restart apache2
}

