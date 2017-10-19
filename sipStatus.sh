#!/bin/bash
#
# sipStatus.sh - Programa feito para identificar troncos sip nao registrados
#
# Autor: Anderson Freitas <tmsi.freitas@gmail.com>
# Site: http://www.dialplanreload.com/
# Repositorio: https://github.com/DialplanReload/sipStatus
#
# Desenvolvido sob licensa GPL. 
# Fique a vontade para contribuir com a evolucao deste programa.
#
# EXECUTE O SCRIPT PASSANDO COMO PARAMETRO O NOME DO TRONCO
# Ex: ./sipStatus.sh syssvoip
#
# EMAIL DE DESTINO
#
mail=anderson.freitas@opens.com.br

#
# ARQUIVO DE LOG
#
archive=/root/scripts/sipStatus.log

date=$(date +%T...%F)

status=$(asterisk -rx "sip show registry" | grep $1 | awk '{print $4}')

if [ $status = "Registered" ] ; then

	echo "$date  TRONCO SIP $1  .......... $status" >> $archive

else

	echo "O TRONCO SIP $1 nao esta registrado" | mailx -s "VERIFICAR TRONCO SIP $1" $mail
        echo "$date TRONCO SIP $1  .......... $status" >> $archive

fi
