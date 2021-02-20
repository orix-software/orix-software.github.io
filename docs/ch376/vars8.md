# CH376 extra vars

## Vars 8

```c
#define VAR_SYS_BASE_INFO 0x20 / * Informations de base du système actuel * /
/ * Le bit 6 est utilisé pour indiquer la sous-classe du périphérique de stockage USB SubClass-Code, le bit 6 est 0 pour indiquer que la sous-classe est 6 et le bit 6 est 1 pour indiquer que la sous-classe est différente de 6 * /
/ * Le bit 5 est utilisé pour indiquer l'état de la configuration USB en mode périphérique USB et l'état de la connexion du périphérique USB en mode hôte USB * /
/ * En mode périphérique USB, si le bit 5 est 1, la configuration USB est terminée et les bits 5 et 0 ne sont pas configurés * /
/ * En mode hôte USB, si le bit 5 est 1, il y a un périphérique USB dans le port USB, et si le bit 5 est 0, il n'y a pas de périphérique USB dans le port USB * /
/ * Le bit 4 est utilisé pour indiquer l'état de verrouillage du tampon en mode périphérique USB. Le bit 4 est 1 signifie que le tampon USB est verrouillé et le bit 6 est 1 signifie qu'il a été libéré * /
/ * Autres bits, réservés, veuillez ne pas modifier * /
#define VAR_RETRY_TIMES 0x25 / * Nombre de tentatives d'opération de transaction USB * /
/ * Si le bit 7 est 0, il ne réessayera pas lorsque NAK est reçu, le bit 7 est 1 et le bit 6 est 0, et réessayera à l'infini lors de la réception de NAK (vous pouvez utiliser la commande CMD_ABORT_NAK pour abandonner la nouvelle tentative), le bit 7 est 1 et 6 est 1 Réessayez au plus 3 secondes lors de la réception de NAK * /
/ * Bit 5 ~ Bit 0 représente le nombre de tentatives après l'expiration du délai * /
#define VAR_FILE_BIT_FLAG 0x26 / * Indicateur de bit en mode fichier hôte * /
/ * Bit 1 et Bit 0, l'indicateur du système de fichiers FAT du disque logique, 00-FAT12, 01-FAT16, 10-FAT32, 11-illégal * /
/ * Bit 2, indique si les données de la table FAT dans le tampon courant ont été modifiées, 0-non modifié, 1-modifié * /
/ * Bit 3, la longueur du fichier doit être modifiée, le fichier actuel est ajouté avec les données, 0-Aucune modification n'est pas ajoutée, 1-Ajouté et doit être modifié * /
/ * Autres bits, réservés, veuillez ne pas modifier * /
#define VAR_DISK_STATUS 0x2B / * État du disque et du fichier en mode fichier hôte * /
#define VAR_SD_BIT_FLAG 0x30 / * Indicateur de bit de la carte SD en mode fichier hôte * /
/ * Bit 0, version de la carte SD, 0- prend uniquement en charge la première version SD, 1- prend en charge la deuxième version SD * /
/ * Bit 1, reconnaissance automatique, carte 0-SD, carte 1-MMC * /
/ * Bit 2, identification automatique, carte SD de capacité standard 0, carte SD 1 grande capacité (HC-SD) * /
/ * Bit 4, délai d'expiration de la commande ACMD41 * /
/ * Bit 5, délai d'expiration de la commande CMD1 * /
/ * Bit 6, délai d'expiration de la commande CMD58 * /
/ * Autres bits, réservés, veuillez ne pas modifier * /
#define VAR_UDISK_TOGGLE 0x31 / * L'indicateur de synchronisation du point de terminaison BULK-IN / BULK-OUT du périphérique de stockage USB * /
/ * Bit 7, indicateur de synchronisation de point de terminaison en bloc * /
/ * Bit 6, indicateur de synchronisation de point de terminaison en bloc * /
/ * Bit 5 ~ Bit 0, doit être 0 * /
#define VAR_UDISK_LUN 0x34 / * Le numéro d'unité logique du périphérique de stockage USB * /
/ * Bit 7 ~ Bit 4, le numéro d'unité logique actuel du périphérique de stockage USB, après que CH376 initialise le périphérique de stockage USB, la valeur par défaut est d'accéder à 0 # unité logique * /
/ * Bit 3 ~ Bit 0, le numéro d'unité logique maximum du périphérique de stockage USB, plus 1 est égal au nombre d'unités logiques * /
#define VAR_SEC_PER_CLUS 0x38 / * Le nombre de secteurs par cluster du disque logique * /
#define VAR_FILE_DIR_INDEX 0x3B / * Le numéro d'index des informations de répertoire de fichiers en cours dans le secteur * /
#define VAR_CLUS_SEC_OFS 0x3C / * Le décalage de secteur du pointeur de fichier actuel dans le cluster, 0xFF pointe vers la fin du fichier, la fin du cluster * /

/ * Variable 32 bits / 4 octets * /
#define VAR_DISK_ROOT 0x44 / * Pour les disques FAT16, c'est le nombre de secteurs occupés par le répertoire racine, et pour les disques FAT32, c'est le numéro de cluster de départ du répertoire racine (longueur totale 32 bits, octet de poids faible en premier) * /
#define VAR_DSK_TOTAL_CLUS 0x48 / * Le nombre total de clusters du disque logique (la longueur totale est de 32 bits, octet de poids faible en premier) * /
#define VAR_DSK_START_LBA 0x4C / * Le numéro de secteur absolu de départ du disque logique LBA (longueur totale 32 bits, octet de poids faible en premier) * /
#define VAR_DSK_DAT_START 0x50 / * LBA de départ de la zone de données du disque logique (la longueur totale est de 32 bits, octet de poids faible en premier) * /
#define VAR_LBA_BUFFER 0x54 / * LBA correspondant aux données du tampon de données actuel du disque (longueur totale 32 bits, octet de poids faible en premier) * /
#define VAR_LBA_CURRENT 0x58 / * L'adresse LBA de départ du disque actuellement lu et écrit (la longueur totale est de 32 bits, octet de poids faible en premier) * /
#define VAR_FAT_DIR_LBA 0x5C / * L'adresse LBA du secteur où se trouvent les informations du répertoire de fichiers en cours (longueur totale 32 bits, octet de poids faible en premier) * /
#define VAR_START_CLUSTER 0x60 / * Le numéro de cluster de départ du fichier ou du répertoire (dossier) actuel (longueur totale 32 bits, octet de poids faible en premier) * /
#define VAR_CURRENT_CLUST 0x64 / * Le numéro de cluster actuel du fichier actuel (la longueur totale est de 32 bits, octet de poids faible en premier) * /
#define VAR_FILE_SIZE 0x68 / * La longueur du fichier actuel (la longueur totale est de 32 bits, octet de poids faible en premier) * /
#define VAR_CURRENT_OFFSET 0x6C / * Le pointeur de fichier actuel, le décalage d'octet de la position actuelle de lecture et d'écriture (longueur totale 32 bits, octet de poids faible en premier) * / 
```
