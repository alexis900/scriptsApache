#!/bin/bash
set -e
function rutaApache {
	local linea=2
	local original=$(sed $linea'q;d' var.conf | cut -f 2 -d "=")
	echo "Quina ruta tindrà l'Apache [$original]"
	read substituir
	sed -i $linea"s;${original};${sub};" var.conf
}

function rutaLogError {
	local linea=6
	local original=$(sed $linea'q;d' var.conf | cut -f 2 -d "=")
	echo "Quina ruta el fitxer d'errors [$original]"
	read substituir
	sed -i $linea"s;${original};${sub};" var.conf
}

function rutaLog {
	local linea=5
	local original=$(sed $linea'q;d' var.conf | cut -f 2 -d "=")
	echo "Quina ruta el fitxer de logs [$original]"
	read substituir
	sed -i $linea"s;${original};${sub};" var.conf
}
