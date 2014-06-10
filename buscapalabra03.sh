#!/bin/bash
# Este script examina un fichero, mostrando las líneas en las que aparece una palabra buscada
# mientras no se encuentre otra palabra que determina el final de la búsqueda
# Es decir, se busca una palabra hasta que se encuentra otra palabra, entonces se para

# buscar la palabra y mostrar la línea que la contiene 


palabraBuscada=$1
fichero=$2
palabraFinal=$3

numlin=1
totallin=`wc -l $fichero | cut -d" " -f1`


while [ $totallin -gt $numlin ]; do
	
	if head -$numlin $fichero | tail -1 | grep ${palabraBuscada} >/dev/null ; then
		echo "he encontrado la palabra en la línea $numlin"
		head -$numlin $fichero | tail -1
	fi
	(( numlin++ ))

	head -$numlin $fichero |tail -1 |grep ${palabraFinal}
	if [ $?	-eq 0 ] ; then
		echo "palabra final encontrada"
		exit;
	fi
done

# Este es el último ejercicio de la rama master antes de que aparezca una nueva rama.
# El profesor encarga un cambio en la especificación de la solución. 
# No se podrá utilizar el comando grep, y no quiere ver tail y head por el bucle principal, porque
# ensucian la legibilidad

# por tanto:

#    Un alumno va a realizar una función para devolver el contenido de una línea del fichero
# la fucnión buscalinea recibe un número y devuelve la línea correspondiente

# otro alumno va  realizar una función "estaen" en la que se pasa una lista de palabras como primer argumento
# y una palabra como segundo argumento.

# Los dos alumnos trabajaran en ramas diferentes, dentro de cada rama habrán varios commits y se llegará a dos soluciones
# se le ocurre
