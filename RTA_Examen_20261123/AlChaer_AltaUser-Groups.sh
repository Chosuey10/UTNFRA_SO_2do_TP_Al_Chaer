#!/bin/bash

USUARIO_REF=$1
LISTA=$2

CLAVE=$(grep "^${USUARIO_REF}:" /etc/shadow | awk -F ':' '{print $2}')

ANT_IFS=$IFS
IFS=$'\n'

for LINEA in $(cat "$LISTA" | grep -v '^#' | grep -v '^$')
do
	USUARIO=$(echo "$LINEA" | awk -F '[:,]' '{print $1}' | tr -d ' \r') 
	GRUPO=$(echo "$LINEA" | awk -F '[:,]' '{print $2}' | tr -d ' \r')

	if [ -n "$GRUPO" ]; then
		if ! grep -q "^${GRUPO}:" /etc/group; then 
			groupadd "$GRUPO"
		fi 

		useradd -m -s /bin/bash -g "$GRUPO" -p "$CLAVE" "$USUARIO"

	fi
done


IFS=$ANT_IFS

