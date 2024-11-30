# submit scripts advanced

## Versions

Kernel v2023.2
submit 2022.4

```bash
#!/bin/submit
```

## Restore from

restore from /etc/orix/menu.cnf

## Restore (2/2)

Apres execution errorlevel vaut:

- 0: ok
- 1: erreur d'ouverture du fichier
- 2: '=' manquant
- 3: nom de variable trop long
- 4: trop de variables
- 5: chaine trop longue
- 6: erreur interne

## Save

Apres execution errorlevel vaut:

- 0: ok
- 1: erreur d'ouverture du fichier

if errorlevel 1 goto erreur ou if errorlevel >=1 goto erreur qui est équivalent
if errorlevel = 1 goto erreur pour ne détecter que le problème d'ouverture du fichier
if errorlevel = 0 goto ok et mettre le traitement d'erreur juste après cette ligne.
on error ne fonctionnera pas ici parce que qu'il ne s'agissit d'erreurs fatales.

## Call

## Chain

Calls a new submit script. If chain is called, the main script is left and the one starts.

chain gets $0 to $09 arg from the script which launch chain. Chain accepts paramaters after submit but it's not handled 

```bash
chain script.sub
```

## On error

## getkey

getkey wait for a key. The value of the key pressed is inserted in "key" variable

## if

## variable
