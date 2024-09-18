<Breadcrumbs />

# Local GIT repository
<Hr />

---

<Breadcrumbs />

## Créer un GIT repository
<Hr />

Il y a deux facons d’obtenir un GIT repository, dans les deux cas vous aurez un Git repository en local sur votre machine, prêt à être utilisé.

1. Transformer un dossier local en GIT repository avec la commande `git init`.
2. Cloner un Git repository à partir d’une URL
  * Supposons que vous vouliez cloner le projet `MonSuperProjet` situé à l’URL http://github.com/MonSuperProjet, il suffira de taper la commande : `git clone http://github.com/MonSuperProjet`
  * Si vous vouliez le renommer `MonSuperProjetLocal`, il suffirait de taper la commande : `git clone http://github.com/MonSuperProjet MonSuperProjetLocal`

<br />

<v-click>
Dans les deux solutions, cela créera un sous-répertoire appelé `.git` qui contiendra tous les fichiers nécessaires au Git repository.
</v-click>

---

<Breadcrumbs />

**À vous de jouer:** Utiliser la console Git pour créer un dossier que vous transformerez en Git repository.

```txt
📂 .git
┣ 📂 hooks
┣ 📂 info
┣ 📂 objects
┣ 📂 refs
┣ 📜 config
┣ 📜 description
┣ 📜 HEAD
┣ 📜 index

```

<div class="text-sm">
<v-clicks>

* **Fichier HEAD:** Suivi de votre branche actuelle
* **Fichier config:** Stockage des informations de configuration pour Git
* **Fichier index:** Suivi de la Staging Area
* **Dossier objects:** Stockage de la data sous la forme d'une série de Snapshots
* **Dossier refs:** Dossier stockant les références aux commits et aux branches
* **Dossier hooks:** Exécution de scripts à des moments précis du flux de travail Git
</v-clicks>
</div>

<!--
* git init
-->

---

<Breadcrumbs />

## Enregistrement des modifications
<Hr />

Chaque fichier dans le Working Directory peut être dans 2 états:

<v-clicks>

* **Tracked:** ce type de fichier est dans votre dernier commit et il peut être **unmodified**, **modified** ou **staged**. En résumé GIT le connaît déjà.
* **Untracked:** ce type de fichier est dans votre Working Directory mais il n’est **pas dans votre dernier commit**, **ni dans la Staging Area**. En résumé, GIT ne le connaît pas encore.
</v-clicks>

---

<Breadcrumbs />

Pour connaître le statut de vos fichiers, utilisez la commande `git status`:

```txt
$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

<br />

<v-clicks>

* Cela signifie que vous avez un Working Directory propre c’est à dire qu’aucun de vos fichiers tracked n’est modifié
* La commande vous indique aussi dans quelle branche vous êtes « **On branch master** ». Pour l’instant la branche est toujours `master` ce qui est l’état par défaut.
</v-clicks>

<v-click>
<div class="mt-5 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-bulb /> Ce terme `master` provient de Bitkeeper, un prédécesseur de Git. Bitkeeper désignait la source de vérité comme le "master repository" et les autres copies comme des "slave repositories". Vous verrez de plus en plus le terme `main` pour des raisons politiques.
</div>
</v-click>

---

<Breadcrumbs />

**À vous de jouer:**

1. Créez un nouveau fichier `liste-de-courses.txt`
2. Ajouter le premier élément `* 3 tomates`
3. Sauveguardez et tapez la commande `git status`. Que voyez-vous ?

<br />

<v-click>

```txt
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        liste-de-courses.txt

nothing added to commit but untracked files present (use "git add" to track)
```
</v-click>

<!--
* Insister sur la couleur rouge
-->

---

<Breadcrumbs />

4. Ajoutez le fichier dans la liste des fichiers **tracked** grâce à la commande `git add liste-de-courses.txt`.

<br />

```txt
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   liste-de-courses.txt
```

<v-click>

Le fichier `liste-de-courses.txt` est-il dans la **Working Area**, la **Staging Area** ou le **.git Repository** ?
</v-click>

<v-click>

* **Working Area** et **Staging Area** uniquement. La commande `git add` permet d’ajouter le fichier dans la **Staging Area**. Il sera dans le **.git Repository** seulement après que le commit ait été réalisé via la commande `git commit`.
</v-click>

<!--
* Insister sur la couleur verte
-->

---

<Breadcrumbs />

### Syntaxe Fileglobs
<Hr />

La commande `git add [<options>] [--] <pathspec>` peut prendre comme valeur de `pathspec` un filepath ou alors un **Fileglobs** (Glob pattern syntax):

<v-clicks>

* `/` pour séparer les segments de chemin d'accès
  * **Exemple:** `path/to/file.txt`
* `*` pour faire correspondre zéro ou plusieurs caractères dans un segment de chemin d'accès
  * **Exemple:** `path/to/*` correspond à tous les fichiers dans `path/to/`
* `?` pour correspondre à un seul caractère dans un segment de chemin d'accès
  * **Exemple:** `?at.txt` correspond à `Bat.txt`, `cat.txt`, `Rat.txt`, ...
* `**` pour faire correspondre un nombre quelconque de segments de chemin, y compris aucun
  * **Exemple:** `path/**/*` correspond à tous les fichiers et dossiers dans `path/`
</v-clicks>

---

<Breadcrumbs />

<v-clicks>

* `{}` pour regrouper des conditions
  * **Exemple:** `{**/*.html,**/*.txt}` correspond à tous les fichiers **HTML** et **texte**
* `[]` pour déclarer une plage de caractères à prendre en compte
  * **Exemple:** `exemple.[0-9]` correspond à tous les fichiers `exemple.0`, `exemple.1`, ...
* `[ !...]` pour annuler une plage de caractères à rechercher 
  * **Exemple:** `exemple.[!0-9]` correspond à tous les fichiers comme `exemple.a`, `exemple.b`, mais pas `exemple.0`
</v-clicks>

---

<Breadcrumbs />

### Création d'un commit
<Hr />

Utilisez la commande `git commit` pour réaliser un commit:

* Avec un message: `git commit -m "Message du commit"`
* Avec un message et une description: `git commit -m "Message du commit" -m "Description"`

<v-click>
<div class="mt-10 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-bulb /> Si vous n’utilisez pas l'option `-m`, GIT lance votre éditeur de texte, préalablement paramétré, et vous demande d’entrer un commentaire pour ce commit. Après avoir fermé votre éditeur de texte, GIT exécute le commit.
</div>
</v-click>


---

<Breadcrumbs />

**À vous de jouer:** Créez un commit avec un message **pertinent**.

<v-click>

```txt
$ git commit -m "Add the grocery list"
[master (root-commit) ee3bc50] Add the grocery list
 1 file changed, 1 insertion(+)
 create mode 100644 liste-de-courses.txt
```

<br />

* GIT vous indique le fichier qui a été commité ainsi que le commentaire associé à ce commit, ici: « **Add the grocery list** ».
* Le fichier `liste-de-courses.txt` a été ajouté à un snapshot archivé/versionné dans le .git repository avec la checksum SHA-1 : `ee3bc50`.
</v-click>

---

<Breadcrumbs />

Ajoutez maintenant un nouvel aliment dans la liste comme `* 2 abricots` et affichez le status.

<v-click>

```txt
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   liste-de-courses.txt 🔴

no changes added to commit (use "git add" and/or "git commit -a")
```

<br />

GIT indique en rouge que le fichier `liste-de-courses.txt` a été modifié mais qu’il n’est pas encore **staged** : « **Changes not staged for commit** ». Comme ce fichier est déjà Tracked, on remarquera la présence du mot **modified**, en rouge devant le fichier, indiquant que ce fichier a déjà fait l’objet d’un archivage dans le .git repository
</v-click>

---

<Breadcrumbs />

Ajoutez cette nouvelle version du fichier dans la Staging Area puis ajoutez encore un aliment et afficher le status:

<v-click>

```txt
$ git status  
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   liste-de-courses.txt 🟢

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   liste-de-courses.txt 🔴
```

* GIT indique en <span class="text-green">vert</span> que le fichier a été **staged** et est prêt pour être commité dans le .git repository  (la liste contient 2 items)
* GIT indique en <span class="text-red">rouge</span> que le fichier a été modifié mais qu’il n’est pas encore **staged** « Changes not staged for commit » (la liste contient 3 items)
</v-click>

---

<Breadcrumbs />

**À vous de jouer:** Faites un commit de la version du fichier contenant 2 aliments.
<v-clicks>

* `git status` vous indique en rouge que le fichier `liste-de-courses.txt` a été modifié (il contient 3 items) mais qu’il n’est pas encore staged.
* Cependant `git status` ne vous dit pas exactement quelles sont les différences entre les versions.
</v-clicks>

---

<Breadcrumbs />

## Annulation des modifications
<Hr />

<v-clicks>

* Pour de-stagger (**unstage**) un fichier, utilisez la commande `git reset HEAD monFichier`
* Pour supprimer (**discard**) des changements fait à un fichier et revenir à la dernière version commitée utilisez la commande ` git checkout -- monFichier`
</v-clicks>

<br />

<v-clicks>

**À vous de jouer:** Ajoutez un nouvel aliment à la liste que vous ajouterez au dernier commit. Veuillez renommer le commit.

```bash
$ git add *
$ git commit --amend -m 'Add the abricots and the cerises'
```
</v-clicks>

---

<Breadcrumbs />

## Comparaison des versions
<Hr />

La commande `git diff` compare la version de la Working Area avec la dernière version présente dans la Staging Area.

**À vous de jouer:** Affichez les différences en utilisant `git diff`
<v-click>

```diff
$ git diff   
diff --git a/liste-de-courses.txt b/liste-de-courses.txt
index f2f170d..5ea5ee9 100644
--- a/liste-de-courses.txt
+++ b/liste-de-courses.txt
@@ -1,2 +1,3 @@
 * 3 tomates
-* 2 abricots
\ No newline at end of file
+* 2 abricots
+* 5 cerises
\ No newline at end of file
```
</v-click>

---

<Breadcrumbs />

Pour comparer la **Staging Area** avec le **.git repo**, utilisez la commande: 

```bash
$ git diff --staged
```
---

<Breadcrumbs />

### Renommer un fichier
<Hr />

**À vous de jouer:**

1. Renommez votre fichier affichez le status
2. Stagez les modifications et affichez le status

<v-clicks>

```txt
$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        renamed:    liste-de-courses.txt -> liste.txt 🟢
```

<div class="mt-5 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-bulb /> La documentation suggère que [Myers](https://blog.jcoglan.com/2017/02/12/the-myers-diff-algorithm-part-1/) est l'algorithme de différence par défaut. En théorie, un nouveau fichier doit être plus de la moitié identique à un fichier supprimé dans un commit donné pour être considéré comme un renommage.
</div>
</v-clicks>



---

<Breadcrumbs />

### Supprimer un fichier
<Hr />

**À vous de jouer:** Supprimez le fichier et affichez le status.

<v-click>

```txt
$ git status
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    liste-de-courses.txt 🔴
```
</v-click>

---

<Breadcrumbs />

## Historique des commits
<Hr />

La commande `git log` permet d'afficher l'historique de nos commits.

**À vous de jouer:** Affichez votre historique.

<v-clicks>

```txt
$ git log
commit 9cb875d6ff6a2f6f84991e202d3ad01e687b1a05 (HEAD -> master)
Author: johannchopin <johannchopin@pm.me>
Date:   Tue Aug 6 16:20:16 2024 +0200

    Add the cerises

commit 88d904d6624373e440a9e8d6c9910180994c8ba6
Author: johannchopin <johannchopin@pm.me>
Date:   Tue Aug 6 15:14:21 2024 +0200

    Add the abricots
```

<div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-bulb /> `git log` ouvre un programme `less` permettant de visualiser un fichier texte page par page. Appuyer sur `q` pour le fermer.
</div>
</v-clicks>

---

<Breadcrumbs />

<v-clicks>

* `git log -p`: montre les différences (**patch**) dans chaque commit
* `git log -p -2`: montre les 2 derniers commits seulement
* `git log --stat`: montre des abréviations de stats pour chaque commit
* `git log --pretty=format:"%h - %an, %cd : %s"`: affiche le détail des commits en pretty print : SHA-1 code – nom de l’auteur, date du commit : commentaire du commit
* `git log --pretty=format:"%h %s" --graph`: :affiche un graphique ASCII montrant les différentes *branches* et l’historique des merges
</v-clicks>

<v-click>
<div class="flex justify-center h-2/5 p-4">
  <img src="/images/git-graph.png" alt="Exemple de git log graph"/>
</div>
</v-click>

---

<Breadcrumbs />

<br />

<v-clicks>

* `git log --since=2.weeks` : montre les commits réalisés depuis 2 semaines
* `git log --since=2024-09-01` : montre les commits réalisés depuis YYYY-MM-DD
</v-clicks>

---

<Breadcrumbs />

## Réécrire l'historique
<Hr />

<br />

<v-clicks>

* La principale tâche de Git est de s'assurer que vous ne perdiez jamais un changement commité.
* Git est également conçu pour vous donner le contrôle total de votre workflow de développement et notamment de définir avec exactitude l'apparence de votre historique de projet.
* ⚠️ Cela crée des conditions pouvant entraîner la **perte de commits**.
</v-clicks>

<v-click>
<div class="flex justify-center h-2/5 p-4">
  <img src="/images/great-power-meme.png" alt="Great power meme"/>
</div>
</v-click>

---

<Breadcrumbs />

### Modification du dernier commit
<Hr />

* La commande `git commit --amend` permet de modifier le commit le plus récent.
* **Cette commande est à utiliser avec prudence** et dans des cas très précis.

<v-click>

**Exemple:** Oublie d'un fichier:

```bash
$ git commit -m 'initial commit'
$ git add forgotten_file
$ git commit --amend --no-edit
```
</v-click>
<v-click>

**Exemple:** Mauvais message de commit:

```bash
$ git commit --amend -m 'new message'
```
</v-click>

<v-click>
<div class="mt-5 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-bulb /> Les commits modifiés sont en réalité des commits entièrement nouveaux.
</div>
</v-click>

---

<Breadcrumbs />

### Modifier des commits plus anciens ou plusieurs commits
<Hr />

<br />
<v-clicks>

* La commande `git rebase` permet de combiner une séquence de commits dans un nouveau commit de base.
* Le rebasage est plus utile et facilement visible dans le contexte d'un workflow de <Link to="git-branching" title="branches"/>.
</v-clicks>
