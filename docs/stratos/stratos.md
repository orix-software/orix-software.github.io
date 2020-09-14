# Stratos

## Specs Générales

* 15 Mo de SRAM
* 1 mo d'eeprom
* Voir s'il faut faire une SRAM séparée pour la vidéo à terme (mais passer en QFP 144 car pas assez de pinout pour séparer les bus)
* ULA 2 améliorée
* 65c816 à 14Mhz
* port USB, port sdcard (stockage principal)
* Os : Orix 
* langage : forth, basic atmos etc ...

## Fonctionnement atmos compatible
* La rom atmos est prête pour lire des .tap directement
* sedoric version sdcard est en cours d'écriture
* ftdos en cours d'écriture
* Detection du mode en fonction de la broche E du cpu ? Si émulation = mode atmos ?
* Lancement de basic11 : chargement en RAM de la rom associée dans les 16 Mo par malloc, puis virtualisation des adresses dans le cpld avec un registre ?

## Cas non gérés
* WIFI : pour l'instant port ethernet avec stack tcp/ip hardware (voir port ethernet), voir s'il faut un ESP32
* Réel FDC 

## Controleur usb, sdcard, clavier, souris

* Ch376 : fat 32, port USB, HID, drivers écrits (émulation aussi)

## Port ethernet 

* ch395 : stack tcp/ip, socket gérés : 8, icmp ...

## EEprom 
* kernel et tout ce qui se met en rom tel que shell, forth etc.
* Programmation : orixcfg
