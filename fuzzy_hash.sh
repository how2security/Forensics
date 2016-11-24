#!/bin/bash

### CORES
amarelo="\e[33;1m"
azul="\e[34;1m"
verde="\e[32;1m"
vermelho="\e[31;1m"
fim="\e[m"

# OUTPUT RESULT
DIR="output_fuzzy_hash"
rm -r $DIR
mkdir $DIR

banner()
{
	echo "#  2▄222222222▄22▄▄▄▄▄▄▄▄▄▄▄22▄222222222▄22▄▄▄▄▄▄▄▄▄▄▄22▄▄▄▄▄▄▄▄▄▄▄22▄▄▄▄▄▄▄▄▄▄▄22▄▄▄▄▄▄▄▄▄▄▄2"
	echo "#  ▐░▌2222222▐░▌▐░░░░░░░░░░░▌▐░▌2222222▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌"
	echo "#  ▐░▌2222222▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌2222222▐░▌2▀▀▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀2▐░█▀▀▀▀▀▀▀▀▀2▐░█▀▀▀▀▀▀▀▀▀2"
	echo "#  ▐░▌2222222▐░▌▐░▌2222222▐░▌▐░▌2222222▐░▌2222222222▐░▌▐░▌2222222222▐░▌2222222222▐░▌2222222222"
	echo "#  ▐░█▄▄▄▄▄▄▄█░▌▐░▌2222222▐░▌▐░▌222▄222▐░▌2▄▄▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄2▐░█▄▄▄▄▄▄▄▄▄2▐░▌2222222222"
	echo "#  ▐░░░░░░░░░░░▌▐░▌2222222▐░▌▐░▌22▐░▌22▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌2222222222"
	echo "#  ▐░█▀▀▀▀▀▀▀█░▌▐░▌2222222▐░▌▐░▌2▐░▌░▌2▐░▌▐░█▀▀▀▀▀▀▀▀▀22▀▀▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀2▐░▌2222222222"
	echo "#  ▐░▌2222222▐░▌▐░▌2222222▐░▌▐░▌▐░▌2▐░▌▐░▌▐░▌22222222222222222222▐░▌▐░▌2222222222▐░▌2222222222"
	echo "#  ▐░▌2222222▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌░▌222▐░▐░▌▐░█▄▄▄▄▄▄▄▄▄22▄▄▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄2▐░█▄▄▄▄▄▄▄▄▄2"
	echo "#  ▐░▌2222222▐░▌▐░░░░░░░░░░░▌▐░░▌22222▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌"
	echo "#  2▀222222222▀22▀▀▀▀▀▀▀▀▀▀▀22▀▀2222222▀▀22▀▀▀▀▀▀▀▀▀▀▀22▀▀▀▀▀▀▀▀▀▀▀22▀▀▀▀▀▀▀▀▀▀▀22▀▀▀▀▀▀▀▀▀▀▀2"
	echo "#  2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222"
	echo -e "$azul##############################################################################################$fim"
	echo -e "$azul# By Wellington Luiz da Silva aka w3ll                                                       #$fim"
	echo -e "$azul#                                                                                            #$fim"
	echo -e "$azul# FUZZY HASH Version 1.0 - How2Sec Lab                                                       #$fim"
	echo -e "$azul#                                                                                            #$fim"
	echo -e "$azul# Created: 28/10/2016  Updated: 28/10/2016                                                   #$fim"
	echo -e "$azul##############################################################################################$fim"

	echo -e "\012"
}
banner

ARQ1=`md5sum $1 | cut -f1 -d" "`
ARQ2=`md5sum $2 | cut -f1 -d" "`

# Validando se o usuario passou no minimo 2 parametros
if [ $# -lt 2 ] ;then
	echo -e "$vermelho""[-] ERROR: You need to specify a FILES$fim"
	echo -e "$verde""[+] Use: $0 <file1> <file2>\n$fim"
	exit 1
fi

if [ $ARQ1 == $ARQ2 ] ;then
	echo -e "$verde""\nMD5:"
	echo -e "$verde""===$fim"
	echo -e "$verde""[+] The files is equal$fim"
	echo -e "$verde""`md5sum $1 $2`$fim"
	exit 0
fi

split -n 4 $1 $1.
split -n 4 $2 $2.

mv $1.* $2.* $DIR/
for SPLIT in a b c d ;do

	ARQ1=`md5sum $DIR/$1.a$SPLIT | cut -f1 -d" "`
	ARQ2=`md5sum $DIR/$2.a$SPLIT | cut -f1 -d" "`
	
	if [ $ARQ1 == $ARQ2 ] ;then
		echo -e "$verde""\nMD5"
		echo -e "$verde""===$fim"
		echo -e "$verde""[+] The files is equal$fim"
		echo -e "$verde""`md5sum $DIR/$1.a$SPLIT $DIR/$2.a$SPLIT`$fim"
	else
		echo -e "$vermelho""\nMD5"
		echo -e "$vermelho""==="
		echo -e "$vermelho""[+] The files is differ$fim"
		echo -e "$vermelho""`md5sum $DIR/$1.a$SPLIT $DIR/$2.a$SPLIT`$fim"
	fi
done

