#!/bin/bash
# Este script examina un fichero, mostrando las líneas en las que aparece una palabra buscada
# mientras no se encuentre otra palabra que determina el final de la búsqueda
# Es decir, se busca una palabra hasta que se encuentra otra palabra, entonces se para

#preparación para empezar el ejercicio.
#sólo muestro las líneas del fichero

fichero=$2

numlin=1
totallin=`wc -l $fichero | cut -d" " -f1`


while [ $totallin -gt $numlin ]; do
	echo " mostrando la línea $numlin "
	head -$numlin $fichero | tail -1
	(( numlin++ ))
done
agua
