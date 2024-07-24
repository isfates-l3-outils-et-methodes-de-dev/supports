---
theme: slidev-theme-dfhi-isfates
class: text-center
highlighter: shiki
transition: slide-up  
course: Outils et méthodes de développement
presenter-name: Johann Chopin
date: Premier semestre de la 3ème années de la licence Informatique et ingénierie du web.
exportFilename: git
---

# <mdi-git /> Introduction à GIT

---
hideInToc: true
---

## Plan
<Hr />

<Toc minDepth="2" maxDepth="4"/>

---

## Les différents types de systèmes existants
<Hr />

<br />

*Le contrôle de version est un système qui enregistre tous les changements faits sur un fichier ou un ensemble de fichiers à travers le temps. Le but est de pouvoir comparer différentes versions de code entre elles, ou/et, de pouvoir revenir en arrière en cas d’incidents.*

---

<Breadcrumbs minDepth="2" />

### Système de contrôle de versions local
<Hr />

<v-clicks>

* Utilisation en local uniquement par un seul développeur
* Chaque version d’un fichier est sauvegardé dans une base de données.
</v-clicks>


<v-click>

RCS (Revision Control System) est un example de VCS (Version Control System).

<div class="flex justify-center h-2/4 p-4">
  <img src="/images/local-vcs.png" alt="Diagramme de contrôle de version local: https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control"/>
</div>
</v-click>

---

<Breadcrumbs minDepth="2" />

### Système de contrôle de versions centralisé
<Hr />

<v-clicks>

* Utilisation collaborative entre plusieurs développeurs
* 1 seul server contient toutes les versions des fichiers versionnés
* Plusieurs clients peuvent faire un check-out d’une version du code et
travailler dessus en même temps
</v-clicks>

<div class="flex h-2/4">
<v-click>
<div class="flex justify-center p-4">
  <img src="/images/centralized-vcs.png" alt="Diagramme de contrôle de version centralisé: https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control"/>
</div>
</v-click>

<v-click>
<div class="flex justify-center h-3/4 p-4">
  <img src="/images/centralized-vcs-logos.png" alt="Logos de Tortoise, svn et perforce" class="!border-0"/>

  * Tortoise
  * SVN
  * Perforce
</div>
</v-click>
</div>

---

<Breadcrumbs minDepth="2" />

### Système de contrôle de versions distribué
<Hr />

<div class="text-sm">
<v-clicks>

* Utilisation collaborative entre plusieurs développeurs
* Les clients ne font pas un simple check-out du dernier snapshot (version) des fichiers, mais un mirroring (une copie) de **tout le repository**, avec tout son historique.
* Ainsi si le server meurt alors que ces systèmes collaboraient avec lui, n’importe lequel des client repositories peut être copié sur le nouveau server et ainsi le rétablir dans sa totalité.
* Chaque clone est vraiment un **full backup de toutes les données**.
</v-clicks>
</div>

<div class="flex justify-center h-3/5 ml-20">
<v-clicks>
<div class="flex justify-center p-4">
  <img src="/images/distributed-vcs.png" alt="Logos de Git, Mercurial, Bazaar et darcs"/>
</div>

<div class="flex h-1/4 p-4">
  <img src="/images/distributed-vcs-logos.png" alt="Diagramme de contrôle de version distribué: https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control" class="!border-0"/>
</div>
</v-clicks>
</div>

---

<Breadcrumbs minDepth="2" />

### Brève histoire de GIT
<Hr />

* Le noyau de Linux est un projet open-source avec un scope très large. De 1991 à 2002, le code n’était versionné cependant qu’à l’aide de patchs et de fichiers archivés

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/linux-kernel.png" alt="Map du kernel de linux" class="!border-0"/>
</div>

<v-clicks>

* En 2002, le projet du noyau de Linux commence à utiliser un DVCS appelé BitKeeper.
* En 2005, BitKeeper était devenu payant arrêteant brutalement les relations avec la communauté qui développait le noyau de Linux.
</v-clicks>

---

<Breadcrumbs minDepth="2" />

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/linus.png" alt="Photo de Linus Torvalds" />
</div>

<v-clicks>

* Cette situation poussa la communauté qui développait Linux et en particulier son créateur, **Linus Torvalds**, à développer leur propre outil basé sur les leçons apprises pendant qu’ils utilisaient BitKeeper.
* En avril 2005, **GIT** est né
</v-clicks>


---

<Breadcrumbs minDepth="2" />

<br />

**GIT est un outil devant être:**

<v-clicks>

* rapide au design simple
* fort à gérer de nombreuses branches parallèles
* complètement distribué
* capable de gérer de grands projets comme le noyau de Linux
</v-clicks>

<br />

<v-click>

* En 2016, GIT devient le logiciel de gestion de version le plus populaire en étant utilisé par
plus de 12 millions de personnes !
</v-click>


---

## Les bases de GIT
<Hr />

<div class="flex justify-center h-3/4 p-4">
  <img src="/images/git-illustration.png" alt="Git illustration de Allison Horst et Julia Lowndes: https://allisonhorst.com/git-github" class="!border-0"/>
</div>

---

<Breadcrumbs minDepth="2" />

### Installation
<Hr />

<div class="flex justify-center h-2/4 p-4">
  <img src="/images/git-download.png" alt="Screenshot site git download"/>
</div>

<p class="text-center">

<mdi-open-in-new /> https://git-scm.com/downloads
</p>


```bash
$ git --version
git version 2.46.0
```

---

<Breadcrumbs minDepth="2" />

<br />

* Sous Windows, ouvrez l'application Git Bash. Il s'agit d'une console **MinTTY**.
* **MinTTY** reconnaît les principales commandes Unix/Linux :
  * `cd` - Changer de dossier
  * `ls` - Liste des fichiers et des dossiers
  * `mv` - Déplacer/renommer des fichiers et des dossiers	
  * `cp` - Copier des fichiers et des dossiers
  * `rm` - Supprimer des fichiers et des dossiers
  * `pwd` - Affiche le path du dossier
  * ...

<div class="flex justify-center h-1/4 p-4">
  <img src="/images/git-bash.png" alt="Logo de GIT bash"/>
</div>

---

<Breadcrumbs minDepth="2" />

### Configuration
<Hr />

<div class="text-sm">
<v-clicks depth="2">

* La première fois qu’on installe GIT, vous voudrez faire quelques setups afin de personnaliser votre installation.
* Git s’installe avec un outil appelé `git config` qui vous permet de configurer certaines variables qui contrôlent la facon dont GIT s’affiche et fonctionne. Ces variables se trouvent à 3 niveaux :
  * `/etc/gitconfig`: ce fichier contient les valeurs de chaque utilisateur sur le système et tous leurs repositories. Vous pouvez lire et écrire dans ce fichier grâce à l’option `--system`.
  * `~/.git/config` ou `~/.config/git/config` : ce fichier contient vos valeurs personnelles. Vous pouvez lire et écrire dans ce fichier grâce à l’option `--global` qui affectera tous les repositories avec lesquels vous travaillez sur votre système.
  * `config` : ce fichier se trouve dans le répertoire GIT (`.git/config`). Vous pouvez forcer GIT à lire et écrire dans ce fichier grâce à l’option `--local` qui est aussi l’option par défaut. Vous devez être présent dans le Git repository pour que cette option fonctionne correctement.
* Chaque niveau inférieur écrase les paramétrages du niveau supérieur. Par exemple, les paramétrages faits dans `.git/config` écrasent ceux dans `/etc/gitconfig`.
</v-clicks>
</div>

---

<Breadcrumbs minDepth="2" />

**À vous de jouer:** Paramétrez votre nom d'utilisateur et votre email:

```bash
$ git config --global user.name "Prénom Nom"
$ git config --global user.email monemail@example.com
```

<br />

<v-clicks>

* En utilisant l’option `--global`, vous n’aurez besoin de le faire qu’une seule fois car GIT utilisera toujours cette information.
* Si vous voulez remplacer ces informations avec un nom différent ou un email différent pour certains projets spécifique, il vous suffit de lancer la commande sans l’option `--global` quand vous êtes dans ce projet.
</v-clicks>

---

<Breadcrumbs minDepth="2" />

<br />

<v-clicks>

* Commande pour afficher la configuration: `git config --list`
* Commande pour voir la valeur associée à une entrée spécifique: `git config user.name`
* Pour avoir accès à l’aide sur une option git :
  * `git help <mon_option_git>`
  * Exemple pour avoir l’aide sur config: `git help config`
  * Cette commande affichera dans votre navigateur web le détail de la documentation sur cette option Git à partir de la doc HTML fournie avec Git lors de son installation.
* Pour accéder à l'aide rapide et concise sur une option git utilisez : `git <mon_option_git> –h`
</v-clicks>

<v-click>

```bash
git add -h
usage: git add [<options>] [--] <pathspec>...

    -n, --dry-run         dry run
    -v, --verbose         be verbose
```
</v-click>

---

<Breadcrumbs minDepth="2" />

### Créer un GIT repository
<Hr />

Il y a deux facons d’obtenir un GIT repository, dans les deux cas vous aurez un Git repository en local sur votre machine, prêt à être utilisé.

1. Transformer un dossier local en GIT repository avec la commande `git init`.
2. Cloner un Git repository à partir d’une URL





















TODO: Ajouter la section **Les bases de GIT**