#!/bin/bash
function crearVirtual {
        virtual+="<VirtualHost $ip:$port>\n"
        virtual+="\tServerAdmin $email\n"
        virtual+="\tDocumentRoot $docroot\n"
        virtual+="\tErrorLog $errlog\n"
        virtual+="\tCustomLog $cuslog\n"
        crearDirectory
        virtual+="</VirtualHost>"
}

function crearDirectory {
        virtual+="\t<Directory $docroot>\n"
        virtual+="\t\tAuthType $method\n"
        virtual+="\t\tAuthUserFile $auth\n"
        virtual+="\t\tRequire $valid\n"
        virtual+="\t</Directory>\n"
}

function creaLloc {
        read -p "Quin és el nom del teu lloc? " virt
        read -p "Quina és la IP? " ip
        read -p "Quin és el port des d'on s'escoltarà? " port
        read -p "Quin és el correu electrònic de l'administrador? " email
        read -p "DocumentRoot " docroot
        read -p "ErrorLog " errlog
        read -p "CustomLog " cuslog
        read -p "AuthType " method
        read -p "AuthUserFile " auth
        read -p "Require " valid
        crearVirtual
        echo -e $virtual > $ruta/sites-available/$virt.conf
}

#Lista los VirtualHost
function llistaSites {
        listaConColor=""
        listaSinColor=""
        num=1
        for i in $(ls $ruta/sites-available/ | grep .conf | cut -d . -f 1)
        do
                if [ -f $ruta/sites-enabled/$i.conf ]
                then
                        listaConColor+="$num) $i\n"
                else
                        listaConColor+="\e[31m$num) $i\e[0m\n"
                fi
                listaSinColor+="$num $i\n"
                (( num++ ))
        done
}

function activaSite {
        read -p "Introdueix el número del lloc " opcion
        act=$(echo -e $listaSinColor | grep $opcion | cut -d " " -f 2)
        a2ensite $act > /dev/null
        systemctl reload apache2
	echo "$data - Has activat el VirtualHost $act" >> $custLog
}

function desactivaSite {
        read -p "Introdueix el número del lloc " opcion
        act=$(echo -e $listaSinColor | grep $opcion | cut -d " " -f 2)
        a2dissite $act > /dev/null
        systemctl reload apache2
	echo "$data - Has desactivat el VirtualHost $act" >> $custLog
}

function eliminaSite {
	read -p "Introdueix el número del lloc a eliminar " opcion
	act=$(echo -e $listaSinColor | grep $opcion |  cut -d " " -f 2)
	rm $ruta/sites-available/$act.conf
	echo "$data - Has eliminat el VirtualHost $act" >> $custLog
}
