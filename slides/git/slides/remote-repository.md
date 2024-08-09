# Remote GIT repository
<Hr />


<div class="flex justify-center h-2/4 p-4">
  <img src="/images/git-remote.png" alt="Remote git repo: https://www.atlassian.com/git/tutorials/syncing" class="!border-0"/>
</div>

---

<Breadcrumbs />

## Introduction

Les **.git Remote Repositories** sont des versions de votre projet qui sont hébergées sur internet par un service provider.

<br />

<v-click>
<div class="grid grid-cols-5 gap-4">
  <img src="/images/github-logo.png" alt="Logo de Github" class="!border-0"/>
  <img src="/images/gitlab-logo.png" alt="Logo de Github" class="!border-0"/>
  <img src="/images/bitbucket-logo.png" alt="Logo de Github" class="!border-0"/>
  <img src="/images/sourceforge-logo.png" alt="Logo de Github" class="!border-0"/>
  <img src="/images/cloudsource-logo.png" alt="Logo de Github" class="!border-0"/>
</div>
</v-click>

<br />

<v-clicks>

* L'action d'uploader de votre .git Repo local vers un remote repository se nomme `push`.
* L'action de télécharger d'un remote repository vers votre .git Repo local se nomme `fetch`.

</v-clicks>

<!--
* GitHub 100Millions d'utilisateurs en 2023
* -->

---

<Breadcrumbs />

Pour ce cours, il vous sera demandé d'utiliser un compte GitHub pour réaliser les travaux pratiques.

<div class="flex justify-center h-1/4 p-4">
  <img src="/images/github-logo.png" alt="Logo de Github" class="!border-0"/>
</div>


<p class="text-center">

<mdi-open-in-new /> https://github.com/login
</p>

---

<Breadcrumbs />

## Authentification SSH
<Hr />

---

<Breadcrumbs />

## Ajout d'un remote repository
<Hr />

Pour push votre .git Repository local sur votre remote sur GitHub:

<v-clicks>

1. Votre *git_repo* doit exister préalablement sur GitHub ! S’il n’existe pas encore, créez-le en lui donnant le nom *git_repo* depuis https://github.com/new!
2. Positionnez-vous dans votre .git Repository local
3. Tapez la commande: `git remote add origin https://github.com/<user_name>/<project_name>`
4. Tapez enfin: `git push -u origin main`
</v-clicks>

<br />
<v-click>

* Le nom ajouté par défaut par git au remote repository est **origin**. Mais vous pouvez aussi le re-définir et lui donner un nom plus explicite avec la commande:

`git remote add <alias> <url_repo>`
</v-click>

---

<Breadcrumbs />

**À vous de jouer:** Créez un repository **public** GitHub pour y pusher votre .git Repository local.

---

<Breadcrumbs />

## Cloner un remote repository
<Hr />

TODO: do the work

---

<Breadcrumbs />

## Lister vos remotes repositories
<Hr />

<br />

* `git remote` - Pour voir vos remotes (shortname seulement)
* `git remote -v` - Pour voir vos remotes (shortname + URL)

---

<Breadcrumbs />

## Fetching: télécharger du remote en local
<Hr />

* `git fetch`: télécharge uniquement les données du remote sans modifier votre HEAD.

**À vous de jouer:** Ajoutez un aliment dans `liste-de-courses.txt` **depuis l'interface de GitHub**. Faites un `git fetch` et affichez le git graph.

<v-click>

```bash
$ git log --oneline --decorate --graph --all
* 04d8095 (origin/main) Add 2 bananes
* 34ca472 (HEAD -> main) Add more cerises
* dc42194 Add the cerises
```
</v-click>

<br />
<div class="text-sm">
<v-clicks>

* Les branches distantes sont exactement comme les branches locales, sauf qu'elles correspondent à des modifications provenant du remote de quelqu'un d'autre.
* Les branches distantes sont **préfixées par le remote auquel elles appartiennent** afin de ne pas les confondre avec les branches locales.
</v-clicks>
</div>

<!--
* git log --oneline --decorate --graph --all
-->

---

<Breadcrumbs />

## git pull
<Hr />

La commande `git pull` est utilisée pour récupérer et télécharger le contenu d'un remote repository et mettre immédiatement à jour le reposity local pour qu'il corresponde à ce contenu.

**À vous de jouer:** Ajoutez à nouveau un aliment dans `liste-de-courses.txt` **depuis l'interface de GitHub**. Faites un `git pull` et affichez le git graph.

<v-click>

```bash
$ git log --oneline --decorate --graph --all
* 03fg423 (HEAD -> main, origin/main) Add 2 kiwis
* 04d8095 Add 2 bananes
* 34ca472 Add more cerises
* dc42194 Add the cerises
```
</v-click>

---

<Breadcrumbs />

## Pushing: Uploader du local vers le remote
<Hr />

La commande `git push` est utilisée pour uploader le contenu d'un repository local (les commits) vers un remote repository.

```txt
$ git push <remote> <branch>
```

<br />

<v-clicks>

* Si la branche remote a divergé de la votre, vous devez **pull** la remote branche et la **merger** avec votre branche locale, puis réessayer de **push**.
* L'option `--force`  fait en sorte que la branche du remote repository corresponde à la branche locale, en supprimant toutes les modifications qui ont pu avoir lieu depuis le dernier pull.
* **⚠️ Soyez sûr de ce que vous faites, vous pourriez perdre de nombreuses heures de travail.**
</v-clicks>
