#!/bin/bash
function mostrarConf {
        echo "Identifica el fitxer [$lloc]"
        read ll
        if [ ! -z $ll ]
        then
                lloc=$ll
        fi
        cat -n $lloc
}

function afegir {
        echo "Selecciona la linea on vols afegir la directiva"
        read liniaAfegir
        echo "Selecciona la directiva que vols afegir"
        read directivaAfegir
        echo "Quants tabuladors s'afegiràn?"
        read tab

        final=""
        i=0
#	Crea los tabuladores
        while [ $i -lt $tab ]
                do
                        final+="\t"
                        (( i++ ))
                done

        final+=$directivaAfegir
        sed -i $liniaAfegir'a\'"$final" $ll
}

function modifica {
        echo "Quina linia vols substituïr? " 
        read linia
        read -p "Per quina directiva ho vols substituïr? " substituir
        original=$(sed $linia'q;d' $ll | cut -f 2 -d " ")
        sed -i $linia"s;${original};${substituir};" $ll
}

function elimina {
        echo "Selecciona la linia que vols eliminar"
        read liniaEliminar
        sed -i $liniaEliminar'd' $fitxer
}

