# SDSI
Devoir 1 - Faille CVE-2018-1111

## 1 Lancer la virtualbox

Commencez par lancer la virtual box Centos7.
```
./lance-vm-centos7.sh
```
Il est recommandé de choisir l'option 1.

Changez le mot de passe de l'utilisateur ensimag (si vous ne le connaissez pas):
```
sudo passwd ensimag
```
Note: Vous pouvez ignorer les warnings à propos de mot de passe trop simple.

## 2 Démarrer les containers

Télécharger les sources dans la virtual box. Ensuite, ouvrez un terminal et placez vous dans le répertoire des sources.
Démarrez les containers attaquant et victime.
```
docker-compose up -d
```
Note: Il est possible que docker-compose ne soit pas installé sur la virtual box.
Si la commande ne marche pas, installez docker-compose. Vous pouvez utiliser le script fourni.
```
./docker-compose.sh
```
Note 2: Lorsque vous démarrez les containers, il est possible que votre session sur la virtual box se verrouille.
Utilisez le mot de passe que vous avez configuré précédemment pour la déverrouiller.
Lorsque vous déverrouillez votre session, vous verrez que toutes les fenêtres que vous aviez ouvertes ont été fermées.
Cependant vos containers ont bien été lancés. Vous pouvez le vérifier en vous plaçant dans le dossier source et en lançant `docker-compose ps`. Vous devriez voir les deux containers en status 'Up'.

## 3 Lancer le PoC

### Attaquant
Ouvrez un terminal et placez vous dans le dossier source.

Ensuite placez vous dans le container de l'attaquant.
```
docker-compose exec attacker bash
```
Puis exécutez le script de l'attaquant.
```
./scripts/attacker.sh
```
L'attaquant est maintenant en attente de la victime.

### Victime
Ouvrez un terminal et placez vous dans le dossier source.

Ensuite placez vous dans le container de la victime.
```
docker-compose exec victim bash
```
Puis exécutez le script de la victime.
```
./scripts/victim.sh
```
Essayer d'exécuter des commandes dans le shell de l'attaquant.
Par exemple, exécutez `cat victim.txt`. Ce fichier n'est présent que chez la victime.

Vous pouvez voir que le shell de la victime a été redirigé chez l'attaquant, que vous avez les droits root
et que la victime ne voit pas du tout les input/output de l'attaquant sur sa machine.

Note: Si vous obtenez l'erreur `Error getting authority: Error initializing authority:
Could not connect: No such file or directory (g-io-error-quark, 1)` lors du lancement du script
terminez l'action pour reprendre la main et relancez le script.

## 4 Supprimer les containers
```
docker-compose down
```
