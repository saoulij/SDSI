# SDSI
Devoir 1 - Faille CVE-2018-1111

### Démarrer les containers
```
docker-compose up -d
```

### Lister les containers
```
docker-compose ps
```
Les containers actifs doivent être dans l'état Up.

### Se connecter aux containers
```
docker-compose exec attacker bash
docker-compose exec victim bash
```

### Supprimer les containers
```
docker-compose down
```
