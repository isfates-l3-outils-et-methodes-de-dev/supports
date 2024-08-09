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

## Ajout d'un remote repository
<Hr />

Pour push votre .git Repository local sur votre remote sur GitHub:

<v-clicks>

1. Votre *git_repo* doit exister préalablement sur GitHub ! S’il n’existe pas encore, créez-le en lui donnant le nom *git_repo* depuis https://github.com/new!
2. Positionnez-vous dans votre .git Repository local
3. Tapez la commande: `git remote add origin https://github.com/<user_name>/<project_name>`
4. Tapez enfin: `git push -u origin master`
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