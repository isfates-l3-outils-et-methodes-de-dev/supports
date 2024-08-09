# Les bases de GIT
<Hr />

<div class="flex justify-center h-3/4 p-4">
  <img src="/images/git-illustration.png" alt="Git illustration de Allison Horst et Julia Lowndes: https://allisonhorst.com/git-github" class="!border-0"/>
</div>

---

<Breadcrumbs />

## Installation
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

<Breadcrumbs />

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

<Breadcrumbs />

## Configuration
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

<Breadcrumbs />

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

<Breadcrumbs />

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

<Breadcrumbs />

## Fonctionnement
<Hr />

L’une des différences majeures entre Git et les autres VCS (RCS, CVS, SVN..) est sa facon de penser à ses données.

<div class="flex justify-center h-2/4 p-4">
  <img src="/images/folder.png" alt="Icon de folder de IconScout" class="!border-0"/>
</div>

---

<Breadcrumbs />

### Différences entre Snapshot et Delta storage
<Hr />

<br />

<v-clicks>

* **Δ Delta storage:** enregistre uniquement les modifications apportées à un fichier ou à un système plutôt que l'état complet. Chaque modification est stockée sous la forme d'un delta ou d'une différence par rapport à la version précédente, et l'état actuel du système est reconstruit en combinant tous les deltas.
* **📷 Snapshot storage:** enregistre l'état complet d'un fichier ou d'un système sous la forme d'une instance unique, appelée **snapshot**. Chaque instantané représente le système à un moment donné et sert de point de référence pour les modifications futures.
</v-clicks>

---

<Breadcrumbs />

<div class="flex justify-center h-3/5 p-4">
  <img src="/images/delta-vs-snapshot.png" alt="Différences entre Snapshot et Delta storage: https://blog.git-init.com/snapshot-vs-delta-storage/"/>
</div>

<div class="grid grid-cols-2 gap-4 text-sm">
<div class="flex flex-col items-center">

  **Récupération du solde du jour 6:**
  <v-clicks>

  * **Delta:** Δ6 + Δ5 + Δ4 + Δ3 + Δ2 + Δ1 = 1,450
  * **Snapshot:** 📷6 = 1,450  
  </v-clicks>
</div>
<div class="flex flex-col items-center">

  **Comparaison du solde entre les jours 4 et 2:**

  <v-clicks>

  * **Delta:** (Δ4 + Δ3 + Δ2 + Δ1) - (Δ2 + Δ1) = -50
  * **Snapshot:** 📷4 - 📷2 = -50
  </v-clicks>
</div>
</div>

---

<Breadcrumbs />

<br />

Git utilise une forme de Snapshot storage.

<v-clicks>

* ✅ Très efficaces pour gérer de nombreuses version
  * GIT ne stocke pas les fichiers non modifiés mais utilise un lien
* ✅ Permet de facilement analyser 2 versions différentes
* ✅ Permet de travailler facilement en parallèle
* ❌ Gère mal les fichiers volumineux
</v-clicks>

---

<Breadcrumbs />

### Les commits
<Hr />

Dans Git, les "snapshots" sont appelés des **commits**.

Git a trois **états fondamentaux** à connaître :

<div class="grid grid-cols-2 gap-4 justify-center h-3/5 p-4">
  <div class="text-sm">
  <v-clicks>

  * **Modified:** le fichier a été modifié dans votre Working directory, mais n’est pas encore **Staged** ou **Commited**.
  * **Staged:** le fichier est poussé dans la **Staging Area**, afin qu’il fasse parti de votre prochain commit.
  * **Commited:** les données sont stockés dans le **.Git Repository**, c’est à dire la base de données locales.
  </v-clicks>

  </div>
  <img src="/images/git-etat.png" alt="Les états de Git: https://medium.com/@lucasmaurer/git-gud-the-working-tree-staging-area-and-local-repo-a1f0f4822018" class="!border-0"/>
</div>

---

<Breadcrumbs />

<br />
<v-clicks>

* **Working Directory:** est un check-out d’une version du projet. Les fichiers sont extraits du .git repository et copiés dans ce répertoire pour être utilisés ou modifiés.
* **Staging Area:** est l’endroit où sont indiqués les fichiers prêts à partir dans le .git repository lors du prochain commit.
* **.git Repository:** est l’endroit où GIT stocke ses metadonnées et ses objets de base de données pour votre projet. C’est la partie la plus importante de GIT et c’est ce qui est copié quand vous clonez un répertoire d’un autre ordinateur.
</v-clicks>

<v-click>

La plupart des opérations fait par GIT ont besoin seulement des fichiers en local. Aucune ressource réseau n’est nécessaire contrairement aux autres systèmes de contrôle de versions centralisés où il y a toujours une latence réseau.
</v-click>


---

<Breadcrumbs />

### Détection des fichiers
<Hr />

**GIT est consistant et intègre!**
<v-clicks>

* avant de stocker un fichier ou une référence vers l’un d’eux, GIT effectue des check-sum (**SHA-1** hash) des fichiers.
* il est impossible de modifier un fichier ou dossier sans que GIT ne le sache ce qui garantit l’intégrité du système.
</v-clicks>

<br />

<v-click>

**SHA-1** est une fonction de hachage cryptographique conçue par la NSA.

```txt
SHA1("Wikipédia, l'encyclopédie libre et gratuite") = 6153A6FA0E4880D9B8D0BE4720F78E895265D0A9
SHA1("Wikipédia, l'encyclopédie libre et gratuitE") = 11F453355B28E1158D4E516A2D3EDF96B3450406.
```
</v-click>

---

<Breadcrumbs />

### Workflow typique
<Hr />

<div class="flex justify-center h-2/5 ">
  <img src="/images/git-flow.png" alt="Workflow typique de Git: https://git-scm.com/book/en/v2/images/areas.png" />
</div>

<div class="text-sm">
<v-clicks>

1. Vous faites un **checkout du projet** du **.git Repository** dans votre **Working Directory**
2. Vous modifiez des fichiers dans votre **Working Directory**
3. Vous les sélectionnez pour les **stager** afin qu’ils fassent partis du prochain commit ce qui les ajoute dans la **Staging Area**
4. Vous faites un **commit**. Les fichiers présents dans la Staging Area sont **archivés comme snapshot permanent** (version permanente) dans votre .git Repository.
</v-clicks>
</div>

---

<Breadcrumbs />

### CLI version vs GUI version
<Hr />

* Git est un outil CLI (Command Line Interface)
* Il existe de nombreuses versions de GIT en mode GUI mais elles ne couvrent qu’une partie des features de GIT en mode CLI.

<br />

<v-click>
<div class="grid grid-cols-3 gap-4">
<div class="flex flex-col items-center">
  <img src="/images/github-desktop.png" alt="Photo de Github Desktop"/>

  Github Desktop
</div>

<div class="flex flex-col items-center">
  <img src="/images/gitkraken.png" alt="Photo de Gitkraken"/>

  Gitkraken
</div>

<div class="flex flex-col items-center">
  <img src="/images/fork.png" class="h-/5" alt="Photo de fork"/>

  Fork
</div>
</div>

<p class="text-center">

<mdi-open-in-new /> https://git-scm.com/downloads/guis
</p>
</v-click>