#!/bin/bash
set -E
set -o functrace

function error {
	local retval=$?
	local lineError=$1
	local fallaScript=$2
	local func=$3
	local tiempo=$(date "+%d/%m/%Y %H:%M:%S")
	echo "$tiempo - Con la función $func falla el Script $fallaScript en la linea $lineError " >> $logErr
}

trap 'error $LINENO ${BASH_SOURCE[0]} ${FUNCNAME[0]}' ERR
