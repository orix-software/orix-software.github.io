# Fonctionnement

Dans tous les cas, les valeurs de RND en $FA ont été copiées en avance

## Si on tape : /#basic11

Cela lance la ROM

## Si on tape : /#basic11 "TAPEFILE"

* Cela va chercher la présence d'un fichier db dans /var/cache/basic11/[FIRSTLETTEROFTAPEFILE]/TAPEFILE.db

* Si TAPEFILE.db est présent, il va lire les 1er octets du fichiers pour poker en $F1 les I/O des joysticks

## Si on tape : /#basic11 -l

Cela va ouvrir le fichier /var/cache/basic11/basic11.db

Et cela va lire la clé du .tap et le nom du soft tronqué à 29 chars.

## Fonctionnement global

Si la rom est lancée sans .tap ou avec un .tap, systématiquement, les valeurs de RND seront écrites en dur en RAM de $FA à $FF. Cela interfera à terme avec la ROM basic oric-1


# Format du fichier .db

version_bin : 1 byte (binary)
rombasic11 : 1 byte, id of the rom
fire2_joy : keyboard fire2 matrix
fire3_joy
down_joy
right_joy
left_joy
fire1_joy
up_joy
