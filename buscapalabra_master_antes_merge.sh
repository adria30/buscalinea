#!/bin/bash
# Este script examina un fichero, mostrando las líneas en las que aparece una palabra buscada
# mientras no se encuentre otra palabra que determina el final de la búsqueda
# Es decir, se busca una palabra hasta que se encuentra otra palabra, entonces se para

#este es el final de la rama master antes del merge, 
#el script incorpora la funcion estaen pero no tiene la fucnión buscalinea,
#seguimos usando head y tail dentro del bucle principal

palabraBuscada=$1
fichero=$2
palabraFinal=$3

numlin=1
totallin=`wc -l $fichero | cut -d" " -f1`

estaen(){
	palabras=$1
	buscada="$2"
	existe="NO"
	for una in $palabras ; do
		if [ $una = "$buscada" ] ; then
			existe="SI"		
		fi
	done

	if [ $existe = "SI" ] ; then
		return 0;
	else 
		return 1;
	fi
}

continuar="SI"

while [ $totallin -gt $numlin ] ; do

	linea=`head -$numlin $fichero | tail -1`
echo $numlin $linea 
	if `estaen "$linea" ${palabraBuscada} ` ; then
		echo "he encontrado la palabra en la línea $numlin"
		echo $linea
	fi
	(( numlin++ ))

	estaen "$(head -$numlin $fichero | tail -1)" "${palabraFinal}"
	if [ $?	-eq 0 ] ; then
		echo "palabra final encontrada"
		exit;
	fi
done
