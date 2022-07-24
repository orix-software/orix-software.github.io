# Description
\
\
Un fichier submit peut faire appel a toutes les commandes du shell a
l'exception des commandes internes suivantes:

- help
- pwd

qui ne sont pas encore supportees.

Les commandes **call**,**choice**,**cls**,
**getkey**,**goto**,**if**,**pause**,
**return** et **type** ont ete ajoutees.

La commande **echo** est etendue par rapport a celle du shell.

Une ligne ne peut exceder *128* caracteres ou *200* apres expansion des variables.

Il n'y a ^Bpas de taille maximale^G pour un fichier submit.

# Description
\
\
Les parametres de la ligne de commande sont accessibles par les variables^C$0^G a^C$9^G.

^C$0^G est le nom du fichier submit.


Les lignes commencant par **REM** ,  ^T#^P , ^T;^P sont des commentaires.

Les lignes commencant par ^T:^P definissent un label.
\
\
\
\
\
\
\
\
\
\
\
# call
\
\
La commande **call** permet de faire
appell a une sous-routine terminee
par **return**.
\
\
## Syntaxe:^P
call^Flabel
\
\
\
\
\
\
\
\
\
\
\
\
\
\
# choice
\
\
La commande **choice** permet d'afficher
un message et de proposer une liste
d'options.
\
\
## Syntaxe:^P
choice ^B[-n] [-c<liste>] [msg]

## Options:^P
- ^B-n^G n'affiche pas les choix
- ^B<liste>^G est une suite de caracteres composant les options possibles. Valeur par defaut: YN
- ^Bmsg^G est le message affiche. Valeur par defaut: aucun

## Exemples:^P
- choice -con Continuer
\
\
\
# echo
\
\
La commande **echo** accepte les caracteres de controle.

Par exemple pour la couleur:

^@^WNoir ^P
^ARouge
^BVert
^CJaune
^DBleu
^EMagenta
^FCyan
 Blanc

  noir
^Qrouge ^P
^@^Rvert ^P
^@^Sjaune ^P
^Tbleu ^P
^Umagenta ^P
^D^Vcyan ^P
^@^Wblanc ^P

Les caracteres de controles sont \^ A a \^[

## Syntaxe:^P
- echo ^B[-n] [message]

## Options:^P
- ^B-n^G ne fait pas de saut de ligne a la suite du message
\
\
# Getkey
\
\
La commande **getkey** permet d'attendre
la frappe d'une touche du clavier.

Le code ASCII de la touche est place
dans la variable^D^Rkey ^P^@.
\
\
## Syntaxe:^P
getkey
\
\
\
\
\
\
\
\
\
\
\
\
# Goto
\
\
La commande **goto** permet de poursuivre
l'execution a un label specifique.

Un label est cree en debutant une ligne
par^F:^Gsuivi d'une chaine de caracteres.
\
\
## Syntaxe:^P
goto^Flabel
\
\
\
\
\
\
\
\
\
\
\
\
# If  (1/2)
\
\
La commande **if** permet de faire
un test par rapport au code erreur de
la derniere commande executee ou de
tester l'existence d'un fichier.
\
\
## Syntaxe:^P
- if ^D^Rvar^C^Pn^Finstruction
- if exist^Efichier^Finstruction
- if ^D^Rvar^B^Pop^Cn^Finstruction
\
Si la valeur de ^D^Rvar^G^Pest superieure ou egale a^Cn^Gou si le fichier
existe alors^Finstruction^Gsera executee.

^D^Rvar^G^P peut etre errorlevel ou key

^Bop^Gpeut etre <, =, > ou #
\
# If  (2/2)
\
\
### Exemples:^P
- [1] if errorlevel 2 goto choix2
- [2] if exist fichier echo Ok
- [3] if errorlevel < 2 echo inferieur
- [4] if keu # 65 echo different
\
\
[1] Ira au label^Fchoix2^Gsi^D^Rerrorlevel^P^G est superieur ou egale a^C2^G.

[2] Affiche^BOk^Gsi^Efichier^Gexiste.

[3] Affiche^Binferieur^Gsi^D^Rerrorlevel ^P^G est inferieur a^C2^G.

[4] Affiche^Bdifferent^Gsi^D^Rkey ^P^G est different de^C65^G.
\
\
\
# Pause
\
\
La commande **pause** affiche un message et attend l'appui sur une touche.

Elle accepte un message optionnel en parametre.
\
\
\
\
## Syntaxe:^P
pause^B[message]

Le message par defaut est:

      ^LPress any key to continue
\
\
\
\
\
\
# Return
\
\
La commande **return** termine une
sous-routine et permet de revenir a la
ligne suivant le **call**.

## Syntaxe:^P
return
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
# Text (1/2)
\
\
Affiche directement tout ce qui est entre **text** et **endtext**
\
Cela permet d'afficher un texte ou un formulaire plus simplement qu'avec
la commande **echo**
\
Les codes de controles sont interpretes ainsi que les parametres du script.
\
**text** et **endtext** doivent etre seuls sur la ligne.
\
\
\
\
\
\
\
# Text (2/2)
\
\
^TExemple:^P

text

Ligne de texte

avec des^[Bcouleurs^[G

endtext
\
\
^Taffiche:^P

Ligne de texte

avec des^Bcouleurs^G
\
\
\
\
\
# Type
\
\
La commande **type** est un alias de **cat**
mais renvoie une erreur si son parametre est absent.

## Syntaxe:^P
type ^Efichier

