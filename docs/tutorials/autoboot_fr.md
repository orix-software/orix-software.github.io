# [Orix] Démarrage personnalisé par autoboot et submit

Depuis la version du kernel v2023.1, il est désormais possible de personnaliser le démarrage d’Orix sur son atmos.

Submit est un langage de scripting issu de CPM mais modifié par Assinie. Assine a fait le code pour Orix mais aussi a amélioré le fonctionnement afin d’intégrer des fonctionnalités en plus. Submit est un langage interprété.

Autoboot est un fichier localisé dans le répertoire “/etc/” et va contenir un script submit. Ce script contenu dans le fichier autoboot sera lancé au boot de l’ordinateur ce qui permettra de personnaliser son boot, faire des menus etc.

Si le fichier autoboot est présent, alors il sera démarré, sinon, cela démarrera normalement sans personnalisation. S’il y a besoin de bypasser ce démarrage par autoboot, il faudra faire un reset par exemple avec une touche quelconque appuyée. Cela va empêcher autoboot de démarrer et permettre d’accéder au shell directement.

Le gros avantage du scripting, c’est que cela permet d’aller vite pour faire quelque chose sans avoir beaucoup de connaissances.

Voici, donc, un tutorial qui va mettre en application un démarrage par autoboot.

## Prerequis

Avoir la twilighte board à jour avec le kernel v2023.1
submit version v2022.4 (vérifier avec ‘submit’)
un éditeur texte sur pc. Il y a un éditeur texte natif en cours de dev, mais il n’est pas finalisé, et donc, il faudra partir sur la clé usb branchée sur le pc, avec “/etc/autoboot” ouvert.
avoir tous les binaires Orix à jour : https://repo.orix.oric.org/dists/official/ sur la clé usb
Pour demander au système de ne pas lire le fichier autoboot au démarrage, appuyer sur une touche au boot. Si autoboot doit être désactivé, il suffit d’aller dans /etc/, faire une copie d’autoboot avec ‘cp’, et supprimer le fichier autoboot

Je veux démarrer blake’s 7 au démarrage
Dans le script submit, je mets juste :

```bash
#!/bin/submit
blakes7
```

Je sauve le fichier, je mets la clé usb, et je démarre l’oric.

Blakes7 démarrera automatiquement

![type:video](https://youtu.be/0f3IOA3p_fQ)

## Démarrage d’un menu personnalisé avec changement de fonte

Cette fois ci, nous allons lancer un menu au boot. Le script suivant va :

effacer l’écran après le boot, mettre la fonte fanta2uk (les fontes sont localisées dans “/usr/share/fonts”).
afficher un menu avec des entrées “basic, blake’s 7, Psychiatric, barbitoric, et Orix” : ces choix sont volontaires car ils permettent de montrer les différents lancements, que cela soit à partir d’une rom, du storage, d’un jeu, ou d’une démo). La commande basic11 prend un argument qui est le nom du .tap à lancer (on peut le trouver en faisant un basic11 -l)
attendre une touche et lancer le programme sélectionné.

```bash
#! /bin/submit
cls
setfont fanta2uk

@ 10,0
text
            +--------------+
             | 1 Basic         |
             | 2 Blake's 7   |
             | 3 Psychatric |
             | 4 Barbitoric  |
             | 5 Orix           |
            +--------------+
endtext
:start
getkey
if key = 49 goto _basic
if key = 50 goto _blake
if key = 51 goto _psy
if key = 52 goto _barbitoric
if key = 53 goto prompt

goto start

:_basic
basic11

:_blake
blakes7

:_barbitoric
barboric

:_psy
basic11 "PSY

:prompt
exit

```

Le résultat en image:


Le résultat en vidéo :

![type:video](https://youtu.be/7wXobqItIEo)


Ce script va lancer, en fonction de la touche pressée, l’entrée voulue (rom basic, blake, psychiatric, barbitoric ou revenir au shell). En revanche, une entrée de fonctionnera pas, c’est barbitoric (pour la version disponible au 7/06/2023).

Pour expliquer pourquoi barbitoric ne fonctionne pas dans le cas où il est localisé dans un script submit, il faut se référer au fonctionnement d’un binaire Orix. Le problème ne se produit pas pour une commande en ROM, mais il peut se produire pour un binaire sur clé usb/sdcard.

Au début du développement d’Orix, un seul format de binaire existait, c’est le fameux format statique que nous connaissons pour du basic, hyperbasic, commandes sedoric etc. Les programmes sont assemblés à une adresse fixe, et il y a conflit si on essaie de charger un programme qui est dans la même plage d’adresse : l’un va écraser l’autre. C’est ce qu’il se passe dans le cas de submit et barbitoric, mais ce n’est pas submit le fautif, c’est le binaire barbitoric en natif Orix. Submit est un binaire sur disque au format 2 Orix. Ce format est relogeable. Le kernel va allouer la plage mémoire disponible en fonction de la taille et reloger au runtime le binaire pour que submit puisse tourner à une nouvelle adresse. Submit tourne donc à une adresse inconnue par l’utilisateur, seul le kernel sait où submit est localisé en RAM. Aussi, Submit va faire des allocations mémoire pour sa propre utilisation.

Ici, barbitoric n’est pas au format relogeable, et quand le kernel va essayer de le lancer, il va regarder s’il est au format 2, s’il est au format 1, le header du binaire définit une adresse fixe. Le kernel va vérifier si l’adresse est occupée. Comme submit a été lancé de manière relogée au 1er offset mémoire libre, il y a conflit et le kernel va renvoyer un “exec format error” qui sera affiché dans submit.

Voici comment vérifier si un binaire est au format relogeable : Il faut utiliser le binaire file.

Vous verrez que file n’indique pas que c’est un binaire relogeable pour barboric (nom du programme barbitoric) :

```bash
/#cd bin
/bin#file barboric
```

Ci dessous, en rouge, le test sur le binaire barbitoric, en vert le même test sur le programme blakes7. Nous voyons bien dans ce cas “reloc binary” en vert

Pour corriger le problème de barbitoric dans le cas de submit, il faut attendre la sortie de la version relogeable. Pour cela, le binaire est converti par un programme après un 1er build du code source.

Les commandes en ROM n’ont pas besoin d’être relogées. Elles sont déjà résidentes en ROM, et ont été conçues pour ne pas écraser les autres commandes. Les commandes sont déjà dans des emplacements mémoire fixes, et gèrent les allocations mémoire de leur coté. De façon générale, les commandes en ROM sont plus rapides car elles sont déjà chargées, n’ont pas besoin d’être relogées et n’occupent pas de RAM dans les 48KB pour son propre code (à part pour les allocations mémoires nécessaires)

Couleurs, caractères de contrôles
Avant d’aller plus loin, l’idéal est de lire la doc “subdoc” en utilisant man. C’est une doc en français qui explique les possibilités de submit

```bash
/#man subdoc
```

Nous avons besoin de personnaliser un peu plus ce menu, et nous allons afficher un texte double hauteur avec quelques couleurs. Cela se fait avec les caractères de contrôle :
```bash
ink_black = ^@
ink_red = ^A
ink_green = ^B
ink_yellow = ^C
ink_blue = ^D
ink_purple = ^E
ink_cyan = ^F
ink_white = ^G

simple_height = ^H
simple_graph = ^I
double_height = ^J
blink_simple = ^L
blink_double = ^N

paper_black = ^P
paper_red = ^Q
paper_green = ^R
paper_yellow = ^S
paper_blue = ^T
paper_purple = ^U
paper_cyan = ^V
paper_white = ^W
```

Nous allons modifier autoboot, pour afficher un bandeau avec sur fond bleu et en écriture rouge le mot menu en double hauteur, puis afficher un encadré magenta avec le menu.

```bash
#! /bin/submit
cls
setfont fanta2uk
echo ^[T +-----------------------------------+
echo ^[T^[J|^[A               Menu         ^[G     |
echo ^[T^[J|^[A               Menu         ^[G     |
echo ^[T +-----------------------------------+

echo

echo ^[U
echo ^[U ^[P         1 Basic                   ^[U
echo ^[U ^[P         2 Blake's 7               ^[U
echo ^[U ^[P         3 Psychatric              ^[U
echo ^[U ^[P         4 Barbitoric              ^[U
echo ^[U ^[P         5 Orix                    ^[U
echo ^[U

:start
getkey
if key = 49 goto _basic
if key = 50 goto _blake
if key = 51 goto _psy
if key = 52 goto _barbitoric
if key = 53 goto prompt

goto start

:_basic
basic11

:_blake
blakes7

:_barbitoric
barboric

:_psy
basic11 "PSY

:prompt
exit
Le résultat
```

## Pour aller plus loin

Submit gère des variables, il est possible de les définir et de les sauver dans un fichier texte (save to myfile) et les restaurer. (restore from myfile)

Submit lit des arguments en paramètre. Ainsi, un script en ligne de commande lancé par submit tel que

```bash
/#submit monscript.sub toto
```

“toto” sera dans la variable $1, permettant de faire des tests avec if.

Il est possible de tester la présence d’un fichier (if exist myfile.txt goto start)

D’afficher un prompt avec input, et récupérer ce qui a été saisi dans une variable.