# Gestion ethernet beta (WIP) : nécessite une carte à insérer dans la twilighte board

ATTENTION : c'est une version en cours de dev, il y a beaucoup de bugs.

* Démarrer l'oric

* s'assurer que le cable réseau est branché sur la carte réseau et que le cable est bien sur un réseau disposant d'un dhcp

* Presser FUNCT+L (pour passer un bug) quitter (ESC) pui presser FUNCT+N et attendre le démarrage de la couche réseau.

3 [OK] en vert devrait apparaitre, si ce n'est pas le cas, se référer à l'erreur concernée (cable débranché, dhcp ...)

* Quand tout est vert, regarder l'ip récupérée au dhcp :

/#ifcfg

L'adresse IP est présente et la mac address de la carte est présente aussi.

* Vérifier les commandes qu'apporte ce démarrage réseau (banque network numéro 34)

/#help -b34

* Vérifier le serveur DNS configuré

/#resvctl

* Faire une résolution dns d'oric.org puis de www.google.com

/#dig www.oric.org

puis

/#dig www.google.com

* Envoyer un message sur un serveur rsyslog

=> nécessite d'avoir un serveur rsyslog sur le réseau acceptant les messages en UDP (à configurer sur le serveur distant)

/#nc -u 192.168.1.200 514 -s MONMSG

* Telecharger un fichier de 5 mo et l'écrire sur disque

/# curl

=> attendre 3 Mins, le programme rend la main.

/# ls -l 

un fichier index.htm de 5mo est présent

/# v
=> fait appelle un serveur web, et récupère un index.hlp qui s'affiche à l'écran


