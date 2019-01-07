# SDSI
Devoir 1 - Faille CVE-2018-1111

## Démarrer les containers
```
docker-compose up -d
```

## Lister les containers
```
docker-compose ps
```
Les containers actifs doivent être dans l'état Up.

## Lancer le PoC
Le PoC consiste à configurer un reverse shell.
L'attaquant peut alors exécuter ce qu'il veut avec les droits root (car NetworkManager est lancé en root) à l'insu de la victime (car toutes les input/output du shell sont redirigées vers l'attaquant).

### Attaquant
```
docker-compose exec attacker bash
./scripts/attacker.sh
```
### Victime
```
docker-compose exec victim bash
./scripts/victim.sh
```

## Supprimer les containers
```
docker-compose down
```
