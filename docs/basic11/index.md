# Fonctionnement

Dans tous les cas, les valeurs de RND en $FA ont été copiées en avance

## Si on tape : /#basic11

Cela lance la ROM

## Si on tape : /#basic11 "TAPEFILE"

* Cela va chercher la présence d'un fichier db dans /var/cache/basic11/[FIRSTLETTEROFTAPEFILE]/TAPEFILE.db

* Si TAPEFILE.db est présent, il va lire les 1er octets du fichiers pour poker en $F1 les I/O des joysticks, sinon il va démarrer la banque 6 qui est la ROM par défaut qui contient le path courant : /home/basic11/

* Le code va regarder l'id de la ROM (stockée en $F2 suite au load des confs au point précédent

* Cela va détecter aussi si le device par défaut est la sdcard ou la clé usb

* Le code va concaténer /usr/share/basic11/basic avec le device courant (us ou sd) puis l'id de la rom converti en ascii

* La rom va être chargée en ram principale puis basic11 va copier un driver en ram principale. Si la rom demandée n'est pas trouvée, le programme s'arrête avec un message d'erreur.

* Ce driver passe en RAM 0 (banque 0) copie la ROM chargée en ram principale, puis va patcher le path par défaut pour accéder au .tap demandé. Ainsi, la ROM serait présente en RAM 0, avec le path par défaut tel que : 
/usr/share/basic11/3/ pour 3dfongus

Ainsi, la ROM a en argument 3Dfongus, et la rom charge donc à partir de là.

Le code gère un maximum de 9 roms en mode usb, et 9 en rom sd. Un soft défini avec une ROM 10 ne fonctionnera pas, c'est à dire que la rom ne sera pas chargée, et un message d'erreur dira qu'il ne trouve pas la rom.

## Si on tape : /#basic11 -l

Cela va ouvrir le fichier /var/cache/basic11/basic11.db

Et cela va lire la clé du .tap et le nom du soft tronqué à 29 chars.

L'espace et le ctrl+c fonctionne ici

## Fonctionnement global

Si la rom est lancée sans .tap ou avec un .tap, systématiquement, les valeurs de RND seront écrites en dur en RAM de $FA à $FF. Cela interfera à terme avec la ROM basic oric-1


# Format du fichier .db

* version_bin : 1 byte (binary)

* rombasic11 : 1 byte, id of the rom

* fire2_joy : keyboard fire2 matrix

* fire3_joy : keyboard fire2 matrix

* down_joy : keyboard fire2 matrix

* right_joy : keyboard fire2 matrix

* left_joy : keyboard fire2 matrix

* fire1_joy : keyboard fire2 matrix

* up_joy : keyboard fire2 matrix

