# SDSI
Devoir 1 - Faille CVE-2018-1111

## 1 Lancer la virtualbox

Commencez par lancer la virtual box Centos7.
```
./lance_vm_centos7.... #TODO
```
Il est recommandé de choisir l'option 1.

## 2 Démarrer les containers

Télécharger les sources dans la virtual box. Ensuite, ouvrez un terminal et placez vous dans le répertoire des sources.
Démarrez les containers attaquant et victime.
```
docker-compose ps
```
Note: Il est possible que docker-compose ne soit pas installé sur la virtual box.
Si la commande ne marche pas, installez docker-compose. Vous pouvez utiliser le script fourni.
```
./docker-compose.sh
```

## 3 Lancer le PoC

### Attaquant
Placez vous dans le container de l'attaquant.
```
docker-compose exec attacker bash
```
Puis exécutez le script de l'attaquant.
```
./scripts/attacker.sh
```
L'attaquant est en attente de la victime.

### Victime
Placez vous dans le container de la victime.
```
docker-compose exec victim bash
```
Puis exécutez le script de la victime.
```
./scripts/victim.sh
```
Essayer d'exécuter des commandes dans le shell de l'attaquant.
Vous pouvez voir que le shell de la victime a été redirigé chez l'attaquant, que vous avez les droits root
et que la victime ne voit pas du tout les input/output de l'attaquant sur sa machine.

## 4 Supprimer les containers
```
docker-compose down
```
