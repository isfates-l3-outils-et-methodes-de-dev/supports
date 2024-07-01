# Orchestration de conteneurs avec Docker
<Hr />

<br />

Le démarrage et l'arrêt des conteneurs sont un peu pénibles, sans parler de l'exécution de deux applications en même temps. Si seulement il existait un moyen, un outil, pour simplifier... **la composition**.

---

<Breadcrumbs />

## Docker Compose
<Hr />

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/docker-compose-logo.png" alt="Logo de Docker compose" class="!border-0"/>
</div>

<v-clicks>
Docker Compose est un outil permettant de définir et d'exécuter des applications multi-conteneurs.

Docker Compose simplifie la gestion des `services`, des `networks` et des `volumes` dans un seul fichier de configuration YAML compréhensible communément appelé `compose.yaml` (vous pourrez également voir le nom `docker-compose.yaml` et `docker-compose.yml`).
</v-clicks>

<!--
* Docker Compose était auparavant un outil séparé, mais il est désormais intégré à Docker et peut être utilisé comme le reste des commandes Docker.
-->

---

<Breadcrumbs />

Docker Compose fonctionne dans tous les environnements: production, staging, développement, tests et CI. Il dispose également de commandes permettant de gérer l'ensemble du cycle de vie de votre application:

<v-clicks>

* Démarrer, arrêter et reconstruire des services
* Afficher l'état des services en cours d'exécution
* Lire le journal des services en cours d'exécution
* Exécuter une commande unique sur un service
</v-clicks>

---

<Breadcrumbs />

### Format YAML
<Hr />

<p class="text-center">

**Yet Another Markup Language (YAML)**
</p>

```yaml
# An employee record
name: Martin D'vloper
job: Developer
employed: True
foods:
  - Apple
  - Orange
  - Strawberry
  - Mango
languages:
  javascript: Elite
  python: Elite
  java: Lame
education: |
  4 GCSEs
  3 A-Levels
```

---
src: ./modèle-application-compose.md
---

---

<Breadcrumbs />

## Docker compose CLI
<Hr />

<div class="text-sm">
<v-clicks>

* `docker compose up` - build les images si elles n'existent pas et démarre tous les services définis dans des conteneurs.
* `docker compose down` - arrête et supprime tous les conteneurs, réseaux et volumes créés par `docker compose up`.
  * `docker compose down --volumes` - supprime les volumes nommés déclarés dans la section des volumes
* `docker compose build` -  build les images de tous les services.
* `docker compose ps` - liste tous les conteneurs en cours d'exécution pour les services définis.
* `docker compose start <services>` - démarre les conteneurs pour les services définis.
* `docker compose stop <services>` - arrête les conteneurs pour les services définis.
* `docker compose restart <services>` - redémarre les conteneurs pour les services définis.
* `docker compose exec <service> <commande>` - exécute une commande à l'intérieur d'un conteneur en cours d'exécution pour un service défini.
* `docker compose --help` - et bien plus encore...
</v-clicks>
</div>

---

<Breadcrumbs />

## Exercice
<Hr />

<br />

<div class="flex justify-center h-1/4 gap-10 p-4">
  <img src="/images/mariadb-logo.png" alt="Logo de Docker compose" class="!border-0"/>
  <img src="/images/phpmyadmin-logo.png" alt="Logo de Docker compose" class="!border-0"/>
  <img src="/images/wordpress-logo.png" alt="Logo de Docker compose" class="!border-0"/>
</div>

Nous allons créer un environnement de développement en local permettant de lancer un site Wordpress sur une base de donnée MariaDB. Il devra être possible d'administrer la base de donnée à l'aide de phpMyAdmin.

---

<Breadcrumbs />

<br />

1. Créez dans un nouveau dossier un fichier `compose.yaml` un service nommé `db` qui:

<br />
<v-clicks>

* se base sur l'image `mariadb:latest`
* stocke ses données de manière persistante dans un `volume` sous le dossier `/var/lib/mysql`
* définit ses variables d'environnements (`environment`): 
  * `MYSQL_RANDOM_ROOT_PASSWORD: 1`
  * le nom de la database
  * un nom d'utilisateur
  * un mot de passe pour l'utilisateur
* définit son `hostname`
* doit toujours redémarrer (`restart`) s'il s'arrête de manière involontaire
</v-clicks>

---

<Breadcrumbs />

```yaml {monaco}
#/ Correction





















#
```

<!--
services:
  db:
    image: mariadb
    volumes:
      - db-volume:/var/lib/mysql
    environment:
      MYSQL_RANDOM_ROOT_PASSWORD: 1
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    hostname: db-host
    restart: always

volumes:
  db-volume:
-->

<v-click>

2. Déplacez `MYSQL_DATABASE`, `MYSQL_USER` et `MYSQL_PASSWORD` dans un ficher `.env`
</v-click>

---

<Breadcrumbs />

<br />

3. Ajoutez un service nommé `phpmyadmin` qui:

<br />
<v-clicks>

* se base sur l'image `phpmyadmin/phpmyadmin`
* se connecte à l'host du service `db`
* est accessible en local sur le port `8080`
* doit toujours redémarrer (`restart`) s'il s'arrête de manière involontaire
</v-clicks>

---

<Breadcrumbs />

```yaml {monaco}
#/ Correction





















#
```

<!--
services:
  db:
    image: mariadb
    volumes:
      - db-volume:/var/lib/mysql
    environment:
      MYSQL_RANDOM_ROOT_PASSWORD: 1
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    hostname: db-host
    restart: always

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    environment:
      PMA_HOST: db-host
    ports:
      - "8080:80"
    restart: always

volumes:
  db-volume:
-->

---

<Breadcrumbs />

<br />

4. Ajoutez un dernier service nommé `wordpress` qui:

<br />
<v-clicks>

* se base sur l'image `wordpress`
* stocke ses données de manière persistante dans un `volume` sous le dossier `/var/lib/mysql`
* se connecte à l'host du service `db` sur la database spécifié avec le bon utilisateur et mot de passe
* est accessible en local sur le port `80`
* doit toujours redémarrer (`restart`) s'il s'arrête de manière involontaire
</v-clicks>

---

<Breadcrumbs />

```yaml {monaco}
#/ Correction





















#
```

<!--
services:
  db:
    image: mariadb
    volumes:
      - db-volume:/var/lib/mysql
    environment:
      MYSQL_RANDOM_ROOT_PASSWORD: 1
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    hostname: db-host
    restart: always

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    environment:
      PMA_HOST: db-host
    ports:
      - "8080:80"
    restart: always

  wordpress:
    image: wordpress
    volumes:
      - wp-volume:/var/www/html/wp-content
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: db-host
      WORDPRESS_DB_USER: ${MYSQL_USER}
      WORDPRESS_DB_PASSWORD: ${MYSQL_PASSWORD}
      WORDPRESS_DB_NAME: ${MYSQL_DATABASE}
    restart: always

volumes:
  db-volume:
  wp-volume:
-->

---

<Breadcrumbs />

## Conteneurs et développement
<Hr />

Les conteneurs ne sont pas seulement utiles en production, ils peuvent également être utilisés dans des environnements de développement.

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/work-on-my-machine.png" alt="Work on my machine meme" />
</div>

---

<Breadcrumbs />

Imaginez juste devoir installer toutes les dépendances d'un tel projet lors de votre premier jours:

<div class="flex justify-center h-4/5 p-4">
  <img src="/images/netflix-architecture.png" alt="Architecture Netflix"/>
</div>

---

<Breadcrumbs />

### Spécification de build
<Hr />

<br />

Un service dans un fichier `compose.yaml` peut démarrer un conteneur à partir d'une image:

```yaml
services:
  frontend:
    image: org/webapp
```

mais peut aussi démarrer un conteneur défini par un Dockerfile localisé dans `build`:

```yaml
services:
  frontend:
    build: ./path-to-dockerfile-folder
    command: ls
```

---

<Breadcrumbs />

### Exercice
<Hr />

**À vous de jouer:** Dans votre repo local de https://github.com/isfates-l3-outils-et-methodes-de-dev/exercices, lisez le `README` du projet `node-dev-env` et créez un fichier `Dockerfile` qui installe les dépendances nécessaires.

```yaml {monaco}
#/ Correction











#
```


<!--
FROM node:20

WORKDIR /usr/src/app

COPY package* ./

RUN npm install
-->

---

<Breadcrumbs />

**À vous de jouer:** Ajoutez maintenant un fichier `compose.yaml` composé d'un service `node-dev-env` qui:

<v-clicks>

* se base sur l'image locale défini par le Dockerfile
* stocke ses données de manière persistante dans un `volume` sous le même dossier que défini dans l'image
* démarre le projet qui sera rendu accessible depuis le port `3000`
</v-clicks>

<v-click>

```yaml {monaco}
#/ Correction









#
```
</v-click>

<!--
N'y a t'il pas un problème avec le fichier index.js dans la fonction plus?

services:
  node-dev-env:
    build: .
    command: npm start
    ports: 
      - 3000:3000
    volumes:
      - ./:/usr/src/app
      - node_modules:/usr/src/app/node_modules

volumes:
  node_modules:
-->


---

<Breadcrumbs />

### Utilisation de Compose Watch
<Hr />

Fraichement sorti fin 2023, [Docker Compose Watch](https://docs.docker.com/compose/file-watch/) permet de synchroniser automatiquement votre code source local avec le code de votre conteneur Docker sans avoir besoin d'utiliser des volumes!

```yaml
services:
  web: 
    build: .
    develop:
      watch:
        - action: sync
          path: ./apps/web
          target: /app/apps/web
          ignore:
            - node_modules
         - action: rebuild
          path: package.json
        - action: sync+restart
          path: ./apps/web/next.config.js
          target: /app/apps/web/next.config.js
```

---

<Breadcrumbs />

<div class="text-xs">

<v-clicks>

L'action `sync` spécifie un chemin à surveiller pour les changements dans le système de fichiers hôte, et un chemin cible correspondant dans le conteneur pour **synchroniser les changements**.

L'action `build` spécifie un chemin d'accès pour surveiller les changements dans le système de fichiers de l'hôte et déclenche une **reconstruction du conteneur** lorsque des changements sont détectés.

L'action `sync+restart` synchronisera d'abord les répertoires, puis redémarrera immédiatement votre conteneur sans le build.
</v-clicks>
</div>

<br />

<v-click>
Pour build et lancer un projet Compose et démarrer le mode watch:

* `docker compose up --watch`
* `docker compose watch` - si vous ne souhaitez pas mélanger les logs de l'application avec les logs de build et les événements de synchronisation du système de fichiers.
</v-click>

---

<Breadcrumbs />

**À vous de jouer:** Modifiez le fichier `compose.yaml` pour utiliser Compose Watch à la place des volumes:


```yaml {monaco}
#/ Correction









#
```

<!--
services:
  node-dev-env:
    build: .
    command: npm start
    ports: 
      - 3000:3000
    develop:
      watch:
        - action: sync
          path: ./
          target: /usr/src/app
          ignore:
            - node_modules/
        - action: rebuild
          path: package.json
-->

---

<Breadcrumbs />

## Docker Compose en production
<Hr />

<div class="text-sm">

Docker compose est réputé pour son utilisation en mode développement, mais une telle orchestration de conteneurs est tout autant utile dans différents environnements tels que CI, staging et production.

C'est pourquoi vous pouvez envisager de définir un fichier Compose supplémentaire, par exemple `production.yml`, qui spécifie la configuration adaptée à la production:

<v-clicks>

* Suppression des liaisons de `volume` non nécessaire
* Se lier à différents ports sur l'hôte
* Définir les variables d'environnement de manières plus sécurisé ([Docker Compose secrets](https://docs.docker.com/compose/use-secrets/))
* Spécifier une politique de redémarrage comme `restart: always` pour éviter les temps d'arrêt
* Ajouter des services supplémentaires tels qu'un agrégateur de logs.
</v-clicks>

<v-click>

Une fois que vous avez un deuxième fichier de configuration, vous pouvez le merger avec l'original avec l'option `-f` :

```bash
$ docker compose -f compose.yml -f production.yml up
```
</v-click>

</div>

---

<Breadcrumbs />

## En résumé
<Hr />

<div class="text-sm">
<v-clicks>

* **Définition manuelle de conteneurs vers une composition**
  * Docker Compose
  * Gestion de services dans un Dockerfile
* **Docker et développement**
  * Build d'images locales avec un Dockerfile
  * Partage de fichiers avec les volumes
  * Docker Watch
* **Docker Compose en production**
  * Merge de fichier de configuration
</v-clicks>

</div>


<v-click>
<div class="flex justify-center h-2/5 p-4">
  <img src="/images/docker-compose-illustration.png" alt="Illustration de Docker compose" class="!border-0"/>
</div>
</v-click>
