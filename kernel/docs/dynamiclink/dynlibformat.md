# Dynamic lib format

Relocatable format.

 name_lib
.res 14
version_lib ; ascii
.res 6
version_num ;
.res 2
number_of_function
.res 1
; définition des fonctions de la lib
entry_1
.res 4 ; offset dans le fichier
entry_2
.res 4 ; offset dans le fichier
