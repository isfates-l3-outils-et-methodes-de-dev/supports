
# Conteneurisation avec Docker
<Hr />

<div class="flex justify-center h-4/5 p-4">
  <img src="/images/netflix-architecture.png" alt="Architecture Netflix"/>
</div>

---

<Breadcrumbs />

## Définitions et concepts de base

--- 

<Breadcrumbs />

### Qu'est-ce que DevOps ?

<Hr />

<v-click>

> *"DevOps est une méthodologie de développement visant à combler le fossé entre le développement et les opérations, en mettant l'accent sur la communication et la collaboration, l'intégration continue, l'assurance qualité et la livraison avec un déploiement automatisé utilisant un ensemble de pratiques de développement."*
>
> &mdash; <cite>[Jabbari et al](https://dl.acm.org/citation.cfm?id=2962707)</cite>
</v-click>

<v-click>

<div class="flex justify-center p-4 h-3/5">
  <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Devops-toolchain.svg" alt="Image wikipedia illustrant la méthodologie DevOps: https://commons.wikimedia.org/wiki/File:Devops-toolchain.svg" class="b-none"/>
</div>
</v-click>

<!--
* Devops: Terme utilisé pour la première fois par Patrick Debois et Andrew Shafer dans leur conférence Agile infrastructure, lors de la 2008 Agile Torontos conference.
-->

---

<Breadcrumbs />

Ce cours se concentre principalement sur les notions:

* Verify
* Packaging
* Releasing
* Configuring

<!--
* Aucun développement dev demandé
-->

---

<Breadcrumbs />

### Qu'est-ce que la virtualisation ?

<Hr />
<div class="mt-10" />

**Virtualisation:** : faire fonctionner sur un même serveur physique, plusieurs systèmes, serveurs (virtualisation système) ou applications (virtualisation applicative) comme s’ils fonctionnaient sur des machines distinctes. La virtualisation est un composant technique clé dans le **Cloud Computing**.

<!--
* Nés dans les années 1990
-->

---

<Breadcrumbs />

**Principes de Virtualisation:**

* Un système d’exploitation principal ou hôte est installé sur un serveur physique unique. Ce système hôte va servir à accueillir plusieurs autres systèmes d’exploitation par le biais d’un logiciel appelé **hyperviseur**.
* **Hyperviseur:** Logiciel de virtualisation.

<v-click>
<div class="flex justify-center h-3/5 p-4">
  <img src="/images/virtualisation-type-1-vs-2.png" alt="Virtualisation type 1 vs type 2. Source https://medium.com/teamresellerclub/type-1-and-type-2-hypervisors-what-makes-them-different-6a1755d6ae2c"/>
</div>
</v-click>

---

<Breadcrumbs />

<div class="text-sm mt-5">

|                                           | Hyperviseurs de type 1                                                                             | Hyperviseurs de type 2                                           |
|-------------------------------------------|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------|
| Également connu sous le nom de            | Hyperviseur matériel nu                                                                            | Hyperviseur hébergé                                              |
| Fonctionne sur                            | Matériel physique sous-jacent de la machine hôte                                                   | Système d'exploitation sous-jacent (système d'exploitation hôte) |
| Idéal pour                                | Charges de travail volumineuses, nécessitant une quantité importante de ressources ou à usage fixe | Environnements de bureau et de développement                     |
| Peut-il négocier des ressources dédiées ? | Oui                                                                                                | Non                                                              |
| Exemples                                  | VMware ESXi, Microsoft Hyper-V, KVM                                                                | Oracle VM VirtualBox, VMware Workstation, Microsoft Virtual PC   |
</div>

---

<Breadcrumbs />

**Intérêts de la virtualisation:**

<div class="text-sm">
  <v-clicks>

  * utilisation optimale des ressources d'un parc de machines
  * installation, déploiement et migration facile des machines virtuelles d'une machine physique à une autre, livraison facilitée
  * économie sur le matériel par mutualisation
    * consommation électrique
    * entretien physique, surveillance
    * support
    * compatibilité matérielle
  * installation, tests, développements, cassage et possibilité de recommencer sans casser le système d'exploitation hôte
  * sécurisation et/ou isolation d'un réseau
  * isolation des différents utilisateurs simultanés d'une même machine
  * allocation dynamique de la puissance de calcul
  </v-clicks>
</div>

---

<Breadcrumbs />

**Limitations de la virtualisation:**

* Redondance de la virtualisation d'un OS
* L'application client est dépendante de l'OS utilisé de base et une migration sera nécessaire pour passer sur un OS "incompatible"


<v-click>
<div class="mt-10 text-center">
<mdi-bulb /> Si seulement il était possible d'être indépendant des différents OS
</div>
</v-click>

---

<Breadcrumbs />

### Qu'est ce que Docker?

<Hr />

<div class="flex justify-center h-3/5">
  <img src="/images/docker-logo.svg" alt="Docker logo" class="!border-0" />
</div>

<v-click>

> *"Docker est un ensemble de produits PaaS (platform as a service) qui utilisent la virtualisation au niveau du système d'exploitation pour fournir des logiciels dans des paquets appelés conteneurs."*
>
> &mdash; <cite>[O'Gara, Maureen](https://web.archive.org/web/20190913100835/http://maureenogara.sys-con.com/node/2747331)</cite>
</v-click>

--- 

<Breadcrumbs />

En éliminant le jargon, nous obtenons 2 définitions :

<v-clicks>

* Docker est un ensemble d'outils permettant de fournir des logiciels dans des conteneurs.
* Les conteneurs sont des paquets de logiciels.
</v-clicks>

<v-clicks>
<span class="text-sm">

**Conteneurs:** abstraction au niveau de la couche applicative qui regroupe le code et les dépendances. Plusieurs conteneurs peuvent fonctionner sur la même machine et partager le noyau du système d'exploitation avec d'autres conteneurs, chacun fonctionnant comme un processus isolé dans l'espace utilisateur.

</span>

<div class="flex justify-center h-60">
  <img src="/images/containerized-application.png" alt="Architecture d'application conteneurisée: https://www.docker.com/resources/what-container/" class="border-0" />
</div>
</v-clicks>


<!--
* L'image illustre comment les conteneurs incluent l'application et ses dépendances. 
* Ces conteneurs sont isolés de manière à ne pas interférer les uns avec les autres ou avec le logiciel qui s'exécute à l'extérieur des conteneurs. 
* Si vous avez besoin d'interagir avec eux ou d'activer des interactions entre eux, Docker propose des outils pour le faire.
-->

--- 

<Breadcrumbs />

Avantages des conteneurs:


<div class="text-sm">
<v-clicks>

* **Résolution du "It works on my machine"**
  * Le logiciel fonctionne sur votre ordinateur, vous l'envoyez sur le serveur et... 💥
  * <mdi-arrow-right-thin /> Les conteneurs résolvent ce problème en permettant au développeur d'exécuter personnellement l'application à l'intérieur d'un conteneur, qui inclut alors toutes les dépendances nécessaires au fonctionnement de l'application.
* **Environnements isolés**
  * Vous devez déployer 5 applications Python différentes qui nécessitent différentes versions de Python sur un serveur commun.
  * <mdi-arrow-right-thin /> Les conteneurs empaquettent le logiciel avec toutes ses dépendances, vous empaquerez chacune des 5 applications avec leurs versions Python.
* **Développement**
  * Vous arrivez sur un projet qui qui nécessite l'utilisation d'autres services comme Postgres, MongoDB, Redis, ...
  * <mdi-arrow-right-thin /> En une seule commande, vous obtenez une application isolée qui tourne sur votre machine.
* **Scaling**
  * Imaginez que vous lancer votre propre Netflix ou Facebook
  * <mdi-arrow-right-thin /> Docker vient avec un système d'orchestration des conteneurs permettant la répartition de la charge.
</v-clicks>
</div>

---

<Breadcrumbs />

<div class="flex justify-center h-2/5">
  <img src="/images/docker-container.png" alt="Illustration d'un container Docker: https://www.mobilise.cloud/alternatives-to-docker-container" class="!border-0" />
</div>

<div class="text-sm">
Docker se base sur les 5 principes des conteneurs industriels utilisés
pour le transport maritime:

<v-clicks>

* **Facilité de chargement:** n’importe quel expéditeur peut se procurer un conteneur et le charger à son rythme sachant qu’il sera accepté par le transporteur.
* **Amélioration de la manutention du conteneur** par sa standardisation (taille).
* **Augmentation de la vitesse** de transport (on transporte le conteneur et non plus les colis un par un).
* **Stockage optimisé** car les dimensions sont **normalisées**, permettant un empilement et un ajustement des espaces de stockage sans perte de place.
* **Interchangeabilité** partout dans le monde: un conteneur endommagé peut facilement être réparé ou remplacé sans retour à son expéditeur.
</v-clicks>
</div>

---

<Breadcrumbs />

Docker est l'outil de compilation, de construction et de test le plus utilisé par les développeurs professionnels. 

<div class="flex justify-center h3/5">
  <img src="/images/stackoverflow-survey.png" alt="StackOverflow Survey 2024" />
</div>

<p class="text-center">

[StackOverflow Survey 2024](https://survey.stackoverflow.co/2024/technology#1-other-tools)
</p>

---

<Breadcrumbs />

### Exécution de conteneurs
<Hr />

**À vous de jouer:** Installez l'application officiel Docker Desktop depuis https://www.docker.com/products/docker-desktop et créez un compte *Docker Personal*.

<div class="flex justify-center h-2/5">
  <img src="/images/docker-desktop.png" alt="Docker Desktop"/>
</div>

Assurez-vous que Docker CLI est bien disponible depuis votre terminal:

```bash
$ docker -v
Docker version 20.10.21, build baeda1f
```

---

<Breadcrumbs />

Créer et exécuter un nouveau conteneur à partir d'une *image* à l'aide de la commande:

```bash
$ docker container run [OPTIONS] IMAGE_NAME [COMMAND] [ARG...]
$ docker run # Aliase
```

**À vous de jouer:** Lancez un container à partir de l'image nommée `hello-world` et analysez l'output du terminal.

--- 

<Breadcrumbs />

**Résultat:**

```bash
$ docker run hello-world     # docker container run hello-world
  Unable to find image 'hello-world:latest' locally
  latest: Pulling from library/hello-world
  b8dfde127a29: Pull complete
  Digest: sha256:308866a43596e83578c7dfa15e27a73011bdd402185a84c5cd7f32a88b501a24
  Status: Downloaded newer image for hello-world:latest

  Hello from Docker!
  This message shows that your installation appears to be working correctly.

  To generate this message, Docker took the following steps:
   1. The Docker client contacted the Docker daemon.
   2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
      (amd64)
   3. The Docker daemon created a new container from that image which runs the
      executable that produces the output you are currently reading.
   4. The Docker daemon streamed that output to the Docker client, which sent it
      to your terminal.
```

<v-click>
Maintenant exécutez à nouveau la même commande. Quelle différence voyez-vous?
</v-click>

---

<Breadcrumbs />

### Images et conteneurs
<Hr />

<p class="text-center font-bold	!mt-10">
<mdi-arrow-right-thin /> Les conteneurs sont des instances d'images.
</p>

<v-click>
<div class="grid grid-cols-2 gap-4 mt-10">
<div class="flex flex-col items-center">
  <img src="/images/meal.jpg" class="h-1/5" alt="Photo d'un repas"/>

  **Conteneur:** un repas prêt à consommer, qu'il suffit de réchauffer et de manger.
</div>
<div class="flex flex-col items-center">
  <img src="/images/recipe.png" class="h-1/5" alt="Photo d'un repas"/>

  **Image:** une recette ou les ingrédients de ce repas.
</div>
</div>
</v-click>

<!--
* Comme nous savons déjà ce que sont les conteneurs, il est plus facile d'expliquer les images à travers eux.
* Une image est comme un plan ou un modèle, tandis qu'un conteneur est une instance de ce plan ou de ce modèle.
-->

---

<Breadcrumbs />

#### Image

<Hr />

<mdi-arrow-right-thin /> Une image Docker est un fichier. Une image ne change jamais; vous ne pouvez pas modifier un fichier existant. La création d'une nouvelle image se fait en partant d'une image de base et en y ajoutant de nouvelles couches (**Layers**).

<v-click>
<br />
<br />

**À vous de jouer:** Listez toutes vos images avec `docker image ls`:

```bash
$ docker image ls
  REPOSITORY      TAG      IMAGE ID       CREATED         SIZE
  hello-world     latest   d1165f221234   9 days ago      13.3kB
```
</v-click>

<!--
* Les conteneurs sont créés à partir d'images
  * Une seule image -> plusieurs conteneurs
* Si des images sont utilisées pour créer des conteneurs, d'où proviennent-elles ?
-->

---

<Breadcrumbs />

#### Dockerfile

<Hr />

Une image est construite à partir d'un fichier d'instructions nommé **Dockerfile** qui est analysé lorsque vous exécutez la commande `docker image build`.

<div class="flex justify-center h-2/5">
  <img src="/images/dockerfile-image-container.png" alt="Relation entre Dockerfile, image et conteneur: https://cto.ai/blog/docker-image-vs-container-vs-dockerfile/" class="!border-0" />
</div>

<v-click>

```dockerfile
# Dockerfile
FROM <image>:<tag>
RUN <installation de dépendances>
CMD <commande qui est exécutée lors de `docker container run`>
```
</v-click>

<!--
* Nous nous pencherons sur les Dockerfiles plus tard, lorsque nous construirons notre propre image.
-->

---

<Breadcrumbs />

#### Conteneur

<Hr />

Listez toutes vos images avec `docker container ls`:

```bash
$ docker container ls
  CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

---
src: ./docker-commands.md
---

---

<Breadcrumbs />


#### Exercice:
<Hr />

1. Démarrer 3 conteneurs à partir de l'image nommé `nginx` en mode détaché avec des noms définis (exemple: `nginx-1`).
2. Arrêtez 1 des conteneurs, supprimez en 1 définitivement et laissez en 1 en cours d'exécution.
3. Afficher dans votre terminal la liste des conteneurs arrêtés et en cours d'exécution de l'image `nginx` uniquement.

---

<Breadcrumbs />

**Réponse:**

```bash
#/ Lancer un container
$ docker run -d --name nginx-1 nginx 

#/ Stopper un conteneur
$ docker container stop nginx-1

#/ Supprimer un conteneur
$ docker container rm -f nginx-1

#/ Lister les conteneurs
$ docker container ls -a -f ancestor=nginx
```

---

<Breadcrumbs />

## Exécution et arrêt des conteneurs
<Hr />

Lancez la commande suivante:

```bash
$ docker container run devopsdockeruh/simple-web-service:ubuntu 
```

<v-click>

Inspectez les logs d'un conteneur *detached* avec la commande:

```bash
$ docker attach --sig-proxy=false <container>
```
</v-click>


<v-click>
<br />

Il est possible de se connecter à un conteneur de manière interactive à l'aide de la commande:

```bash
$ docker exec -it <container> COMMAND
```

<div class="text-xs">

* `-i, --interactive`: Garder STDIN ouvert
* `-t, --tty`: Allouer un pseudo-TTY
</div>
</v-click>


<!--
* Le terminal ne peut pas être quitté
* docker exec -it <container> bash
-->

---

<Breadcrumbs />

**À vous de jouer:** Connectez vous à votre container `devopsdockeruh/simple-web-service:ubuntu` et afficher le contenu du fichier `/usr/src/app/text.log`.

---

<Breadcrumbs />

## Analyse des images
<Hr />

Les images sont les blocs de construction de base pour les conteneurs et les autres images. Lorsque vous "conteneurisez" une application, vous travaillez à la construction de l'image.

---

<Breadcrumbs />

### D'où viennent les images ?
<Hr />

<div class="flex justify-center h-1/4 p-4">
  <img src="/images/docker-hub.png" alt="Logo de DockerHub"/>
</div>


<v-click>

```bash
$ docker search hello-world

  NAME                         DESCRIPTION    STARS   OFFICIAL   AUTOMATED
  hello-world                  Hello World!…  1988     [OK]
  kitematic/hello-world-nginx  A light-weig…  153
  tutum/hello-world            Image to tes…  90                 [OK]
  ...
```
<p class="text-right text-xs">

[https://hub.docker.com/](https://hub.docker.com/)
</p>
</v-click>

<v-click>
<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative text-xs" role="alert">
<mdi-alert-circle /> Gardez à l'esprit que nous téléchargeons du contenu à partir d'Internet. Il est toujours bon de vérifier ce que vous utilisez.
</div>
</v-click>

<!--
* Les images officielles sont sélectionnées et examinées par Docker, Inc.
-->

---

<Breadcrumbs />

### Analyse détaillée d'une image
<Hr />

Chaque version d'image est associée à un tag:

```bash
$ docker pull ubuntu
$ docker pull ubuntu:latest
```

<v-click>

Il est possible de taguer et renommer les images localement avec `docker tag`:

```bash
$ docker tag ubuntu:20.04 ubuntu:focal
$ docker tag ubuntu:20.04 secret-linux-distro:focal
```
</v-click>

<v-click>
<br />

Le nom d'une image peut être composé de 3 parties plus un tag: `registry/organisation/image:tag`

```bash
$ docker pull docker.io/library/ubuntu
```
</v-click>

---

<Breadcrumbs />

### Build une image
<Hr />

**À vous de jouer:** Créez un script nommé `hello.sh`  dans un nouveau dossier vide:


```sh
#!/bin/sh
echo "Hello, docker!"
```

Ajoutez ensuite un `Dockerfile`:

<div class="!text-sm">

```dockerfile
# Utiliser l'image alpine comme base qui est une petite distribution Linux
FROM alpine:3.20
# Utiliser /usr/src/app comme répertoire de travail. Les instructions suivantes seront exécutées à cet endroit.
WORKDIR /usr/src/app
# Copier le fichier hello.sh de ce répertoire vers /usr/src/app/ en créant /usr/src/app/hello.sh
COPY hello.sh .
# Ajouter les permissions d'exécution pendant la construction.
RUN chmod +x hello.sh
# Lors de l'exécution de docker run, la commande sera ./hello.sh
CMD ./hello.sh
```
</div>


<!--
* le script ne fonctionne pas sur windows mais c'est pas grave
-->

---

<Breadcrumbs />

<br />

<mdi-arrow-right-thin /> Nous pouvons utiliser la commande [`docker build`](https://docs.docker.com/reference/cli/docker/build-legacy/) pour transformer le Dockerfile en une image:

```bash
$ docker build . -t hello-docker
```

<v-click>

Assurons-nous que l'image existe et lancez là:

```bash
$ docker image ls
  REPOSITORY            TAG          IMAGE ID       CREATED         SIZE
  hello-docker          latest       5f8f5d7445f3   4 minutes ago   7.73MB
```
</v-click>

<v-click>

Inspectez la présence du fichier dans notre image:

```bash
$ docker run -it hello-docker sh
```
</v-click>


<!--
* Debrieffer ce qu'il se passe lors du build
* sh version simplifié de bash
-->

---

<Breadcrumbs />

### Exercice
<Hr />

<div class="text-xs mt-5">

1. Créez un nouveau fichier script.sh sur votre machine locale avec le contenu suivant :

```sh
while true
do
  echo "Input website:"
  read website; echo "Searching.."
  sleep 1; curl http://$website
done
```

2. Créez un `Dockerfile` pour une nouvelle image à partir de `ubuntu:24.04` et ajoutez des instructions pour installer `curl` dans cette image. Configurez l'image pour que le script s'exécute au démarrage du conteneur et vous laisse entrer un site web:


```bash
Input website:
dfhi-isfates.eu
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
...
```
</div>

<!--
Dockerfile:
FROM ubuntu:24.04

WORKDIR /usr/src/app

COPY curler.sh .

RUN apt-get update && apt-get install -y curl
RUN chmod +x curler.sh

CMD ./curler.sh
-->

---

<Breadcrumbs />

### Différence entre les instructions CMD et ENTRYPOINT
<Hr />

* `ENTRYPOINT` doit être défini lorsque le conteneur est utilisé comme exécutable.

* `CMD` doit être utilisé pour définir les arguments par défaut d'une commande `ENTRYPOINT` ou pour exécuter une commande dans un conteneur.

```dockerfile
FROM ubuntu:24.04

RUN apt-get update && apt-get install -y python3

ENTRYPOINT ["python3"]
```

---

<Breadcrumbs />

## Stockage des données
<Hr />
Par défaut, tous les fichiers créés à l'intérieur d'un conteneur sont stockés sur une couche de conteneur accessible en écriture. Cela signifie que :

* Les données ne persistent pas lorsque le conteneur n'existe plus, et il peut être difficile de sortir les données du conteneur si un autre processus en a besoin.
* La couche inscriptible d'un conteneur est étroitement liée à la machine hôte sur laquelle tourne le conteneur. Il n'est pas facile de déplacer les données ailleurs.

---

<Breadcrumbs />

<br />

* 2 options pour que les conteneurs stockent les fichiers sur la machine hôte de manière persistante: les **volumes** et les **bind mounts**.
* 1 option de stockage in-memory rendant le stockage non persistants: **tmpfs mount**.

<div class="flex justify-center h-3/5 p-4">
  <img src="/images/docker-storage.png" alt="Différentes options de stockage avec Docker" class="!border-0"/>
</div>


<!--
* Les volumes sont stockés dans une partie du système de fichiers de l'hôte qui est gérée par Docker. Les volumes sont le meilleur moyen de conserver les données dans Docker.
* Lesbind mounts peuvent être stockés n'importe où sur le système hôte. Il peut même s'agir de fichiers ou de répertoires système importants. Les processus non Docker sur l'hôte Docker ou un conteneur Docker peuvent les modifier à tout moment.
* Les montages tmpfs sont stockés uniquement dans la mémoire du système hôte et ne sont jamais écrits dans le système de fichiers du système hôte.
-->

---

<Breadcrumbs />

### Les volumes
<Hr />

1. Lancez un conteneur `mysql`:

```bash
$ docker run --name my-database -e MYSQL_ROOT_PASSWORD=my-secret-pwd -d mysql
```
<v-click>

2. Affichez les volumes:
   
```bash
$ docker volume ls
```
</v-click>

<v-click>

3. Inspectez le volume généré:
   
```bash
$ docker volume inspect <volume>
```
</v-click>


---

<Breadcrumbs />

## Les ports
<Hr />

L'ouverture d'une connexion entre le monde extérieur et un conteneur Docker se fait en deux étapes :

1. Exposer le port
2. Publier le port

<v-click>
<br />

Exposer le port d'un conteneur signifie indiquer à Docker que le conteneur écoute sur un certain port. Pour exposer un port, ajoutez l'instruction `EXPOSE <port>` dans votre `Dockerfile`.
</v-click>

<v-click>

Pour publier un port, lancez le conteneur avec `-p <host-port>:<container-port>`.
</v-click>


---

<Breadcrumbs />

**À vous de jouer:** Lancez le conteneur `docker/welcome-to-docker` qui expose sont port `80` sur votre port local `8080`.

<v-click>
<br />

**Réponse:**

```bash
docker run -d -p 8080:80 docker/welcome-to-docker
```

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/congrats.png" alt="Félicitation"/>
</div>
</v-click>

---

<Breadcrumbs />

## Publier une image
<Hr />

Publions ensemble notre image locale `hello-docker`:

<v-clicks>

1. Modifiez le fichier `hello.sh` pour le personnaliser et refaites un build de l'image. 
2. Connectez-vous à https://hub.docker.com et cliquez sur `Create repository`.
3. Nommez le repository `hello-docker` et définir la visibilité comme **publique**.
4. Renommer votre image locale: `docker tag hello-docker <username>/hello-docker`.
5. Finalement publiez l'image: `docker push <username>/hello-docker`.
6. Lancez les conteneurs des autres: `docker run <username>/hello-docker`.
</v-clicks>


---

<Breadcrumbs />

## Best practices pour builder une image
<Hr />

<div class="flex justify-center h-2/4 p-4">
  <img src="/images/bart-best-practices.png" alt="Architecture Netflix"/>
</div>

---

<Breadcrumbs />

### Analyse des layers d'une image
<Hr />

En utilisant la commande `docker image history`, vous pouvez voir la commande qui a été utilisée pour créer chaque layer dans une image:

```bash
$ docker image history hello-docker

IMAGE          CREATED      CREATED BY                                      SIZE      COMMENT
270ca8d5e06b   4 days ago   CMD ["/bin/sh" "-c" "./hello.sh"]               0B        buildkit.dockerfile.v0  
<missing>      4 days ago   RUN /bin/sh -c chmod +x hello.sh # buildkit     31B       buildkit.dockerfile.v0  
<missing>      4 days ago   COPY hello.sh . # buildkit                      31B       buildkit.dockerfile.v0  
```

La taille de chaque layer est visible ce qui facilite le diagnostic des images de trop grande taille.

Ajoutez l'option `--no-trunc` pour éviter de tronquer les lignes.

---

<Breadcrumbs />

### Gérer le cache des layers
<Hr />

Lors de la construction d'une image, Docker parcourt les instructions de votre Dockerfile, exécutant chacune d'entre elles dans l'ordre spécifié. Pour chaque instruction, Docker vérifie s'il peut réutiliser l'instruction du cache de construction.

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/layer-cache.png" alt="Architecture Netflix"/>
</div>

Si un layer est modifié, tous les autres layers qui le suivent doivent également être réexécutés.


---

<Breadcrumbs />

<br />

<mdi-arrow-right-thin /> Ordonnez les instructions en allant de celles qui sont modifiées le moins souvent à celles qui sont modifiées le plus souvent lorsque c'est possible.

<div class="grid grid-cols-2 gap-4 mt-10">

<v-click>
<div>
<p class="text-sm">
❌ Installation des dépendances à chaques build:
</p>

```dockerfile
FROM node
WORKDIR /app
COPY . .          # Copie des fichiers
RUN npm install   # Installer les dépendances
RUN npm build     # Lancer le build
```
</div>
</v-click>

<v-click>
<div>
<p class="text-sm">
✅ Installation des dépendances si nécessaire:
</p>

```dockerfile
FROM node
WORKDIR /app
COPY package.json yarn.lock .  # Copie des packages
RUN npm install                # Installer les dépendances
COPY . .                       # Copie des fichiers
RUN npm build                  # Lancer le build
```
</div>
</v-click>

</div>

<!--
* Pour les instructions COPY, l'heure de modification et la taille des métadonnées du fichier sont utilisées pour déterminer si la mémoire cache est valide. Lors de la consultation du cache, le cache est invalidé si les métadonnées du fichier ont changé pour l'un des fichiers concernés.
-->

---

<Breadcrumbs />

### Réduire la taille des layers
<Hr />

1. Ne pas inclure de fichiers inutiles
```dockerfile
COPY . /src                 # ❌ Copie de tout le context local (logs, artifacts et ancien builds)
COPY ./Makefile ./src /src  # ✅ Copie explicite de fichiers ou dossiers
```

Utilisez un fichier `.dockerignore` pour exclure des fichiers ou des dossiers du contexte du build.

```
target/

*.class
*.log
*.jar
```
<br />

2. Utilisez votre package manager efficacement

Veillez à n'installer que les paquets dont vous avez besoin. Si vous ne les utilisez pas, ne les installez pas.

---

<Breadcrumbs />

### Minimiser le nombre de layers
<Hr />

Moins de layers signifie moins de choses à reconstruire lorsque quelque chose change dans votre Dockerfile.


1. Utilisez une image de base appropriée
   * `postgres`, `python`, `maven`, `kibana`, ...


---

<Breadcrumbs />

<br />

2. Utilisez des multi-stage builds
   * Diviser votre Dockerfile en plusieurs étapes distinctes
   * Permet de séparer les dépendances de compilation des dépendances d'exécution
   * Docker établit les dépendances entre les étapes et les exécute en utilisant la stratégie la plus efficace

**Exemple de multi-stage build:**

```dockerfile
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps 
```

<!--
* Tomcat est un serveur HTTP
-->

---

<Breadcrumbs />

<br />

3. Combinez les commandes dans la mesure du possible


<p class="!mb-0">❌ 2 layers</p>

```dockerfile
RUN echo "la première commande"
RUN echo "la deuxième commande"
```

<p class="!mb-0">✅ 1 seule layer</p>

```dockerfile
RUN echo "la première commande" && echo "la deuxième commande"
#/ ou pour diviser en plusieurs lignes
RUN echo "la première commande" && \
    echo "la deuxième commande"
```

---

<Breadcrumbs />

## En résumé
<Hr />

<div class="text-sm">
<v-clicks>

* **Définition et usage de la méthodologie DevOps**
  * Virtualisation
  * Docker
* **Images et conteneurs**
  * Gestion et création d'une images
  * Lancement et développement de conteneurs
* **Interaction avec les conteneurs**
  * Volumes
  * Ports
* **Publishing d'une image**
  * Docker Hub
</v-clicks>
<br />

<v-click>

<mdi-arrow-right-thin /> Après avoir créé une image, n'importe qui peut prendre et exécuter une application sans problème de dépendance ou de version.
</v-click>

</div>


---

<Breadcrumbs />

## Exercice:
<Hr />

**À vous de jouer:** Certains de nos coéquipiers développeurs ont créé une application avec un `README` qui indique ce qu'il faut installer et comment exécuter une application Ruby on Rails.

Ouvrez ce projet https://github.com/isfates-l3-outils-et-methodes-de-dev/exercices/tree/main/rails-example-project, lisez le `README` et créez un fichier `Dockerfile` permettant de lancer l'application web dans un conteneur.


---

<Breadcrumbs />

**Correction:**

```Dockerfile {monaco}
FROM ...



















#
```

<!--
FROM ruby:3.1.0

EXPOSE 3000

WORKDIR /usr/src/app

RUN gem install bundler:2.3.3

COPY . .

RUN bundle install

RUN rails db:migrate RAILS_ENV=production

RUN rake assets:precompile

CMD ["rails", "s", "-e", "production"]
-->


