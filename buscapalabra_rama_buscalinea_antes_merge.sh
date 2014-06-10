#!/bin/bash
# Este script examina un fichero, mostrando las líneas en las que aparece una palabra buscada
# mientras no se encuentre otra palabra que determina el final de la búsqueda
# Es decir, se busca una palabra hasta que se encuentra otra palabra, entonces se para


#este es el final de la rama buscalinea antes del merge, 
#el script incorpora la funcion buscalinea pero no tiene la fucnión estaen, seguimos usando grep

palabraBuscada=$1
fichero=$2
palabraFinal=$3

numlin=1
totallin=`wc -l $fichero | cut -d" " -f1`

buscalinea() {
	head -$1 $fichero | tail -1
}



while [ $totallin -gt $numlin ] ; do

	linea=`buscalinea $numlin`

	if echo $linea | grep ${palabraBuscada} >/dev/null ; then
		echo "he encontrado la palabra en la línea $numlin"
		echo $linea
	fi
	(( numlin++ ))

	echo $linea | grep ${palabraFinal}
	if [ $?	-eq 0 ] ; then
		echo "palabra final encontrada"
		exit;
	fi
done
