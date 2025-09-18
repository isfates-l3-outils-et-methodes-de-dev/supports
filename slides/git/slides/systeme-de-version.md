# Les différents types de systèmes existants
<Hr />

<br />

*Le contrôle de version est un système qui enregistre tous les changements faits sur un fichier ou un ensemble de fichiers à travers le temps. Le but est de pouvoir comparer différentes versions de code entre elles, ou/et, de pouvoir revenir en arrière en cas d’incidents.*

---

<Breadcrumbs />

## Système de contrôle de versions local
<Hr />

<v-clicks>

* Utilisation en local uniquement par un seul développeur
* Chaque version d’un fichier est sauvegardé dans une base de données.
</v-clicks>


<v-click>

RCS (Revision Control System) est un exemple de VCS (Version Control System).

<div class="flex justify-center h-2/4 p-4">
  <img src="/images/local-vcs.png" alt="Diagramme de contrôle de version local: https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control"/>
</div>
</v-click>

---

<Breadcrumbs />

## Système de contrôle de versions centralisé
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

<Breadcrumbs />

## Système de contrôle de versions distribué
<Hr />

<div class="text-sm">
<v-clicks>

* Utilisation collaborative entre plusieurs développeurs
* Les clients ne font pas un simple check-out du dernier snapshot (version) des fichiers, mais un mirroring (une copie) de **tout le repository**, avec tout son historique.
* Ainsi si le serveur meurt alors que ces systèmes collaboraient avec lui, n’importe lequel des client repositories peut être copié sur le nouveau serveur et ainsi le rétablir dans sa totalité.
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

<Breadcrumbs />

## Brève histoire de GIT
<Hr />

* Le noyau de Linux est un projet open-source avec un scope très large. De 1991 à 2002, le code n’était versionné cependant qu’à l’aide de patchs et de fichiers archivés

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/linux-kernel.png" alt="Map du kernel de linux" class="!border-0"/>
</div>

<v-clicks>

* En 2002, le projet du noyau de Linux commence à utiliser un DVCS appelé BitKeeper.
* En 2005, BitKeeper était devenu payant arrêtant brutalement les relations avec la communauté qui développait le noyau de Linux.
</v-clicks>

---

<Breadcrumbs />

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/linus.png" alt="Photo de Linus Torvalds" />
</div>

<v-clicks>

* Cette situation poussa la communauté qui développait Linux et en particulier son créateur, **Linus Torvalds**, à développer leur propre outil basé sur les leçons apprises pendant qu’ils utilisaient BitKeeper.
* En avril 2005, **GIT** est né
</v-clicks>


---

<Breadcrumbs />

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

<Breadcrumbs />

**Quelle est la signification de Git ?**

<v-clicks>

* La première raison pourrait être considérée comme pratique. Une commande de trois lettres pratique est rapide et facile à dire et à taper.
* Le mot `git` n'est utilisé par aucune autre commande Unix existante.
* La première version du code de Git était très simple, à tel point qu'il la trouve digne d'être insultée.
* Un acronyme pour **Global Information Tracker**, lorsqu'il fonctionne correctement.
* Un acronyme pour **Goddamn Idiotic Truckload of sh*t**, lorsqu'il ne fonctionne pas correctement.
</v-clicks>

---

<Breadcrumbs />

Linus Torvalds fait son premier commit du code de Git le 7 avril 2005.

Dans ce commit, il a inclus un fichier appelé `README`:

```txt
GIT - the stupid content tracker

"git" can mean anything, depending on your mood.

 - random three-letter combination that is pronounceable, and not 
   actually used by any common UNIX command.  The fact that it is a
   mispronunciation of "get" may or may not be relevant.
 - stupid. contemptible and despicable. simple. Take your pick from the 
   dictionary of slang.
 - "global information tracker": you're in a good mood, and it actually
   works for you. Angels sing, and a light suddenly fills the room. 
 - "goddamn idiotic truckload of sh*t": when it breaks

This is a stupid (but extremely fast) directory content manager.  It  
doesn't do a whole lot, but what it _does_ do is track directory
contents efficiently.
```
