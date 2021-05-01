# XCALLFUNCTILIB

Check if the id of the function is valid ?

Calls always $c000 of the bank ?

L'avantage de passer par une fonction dispatch de la librairie est que son format peut être libre et ça décharge le noyau de la gestion des tables de fonctions.

    OPENLIB pour charger la librairie et la reloger comme tu le proposes
    XCALL: on a besoin de l'id de la librairie, du numéro de fonction et de ses paramètres.


