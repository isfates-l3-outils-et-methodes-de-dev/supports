# Tags
<Hr />

GIT permet de **tagger** dans l’historique des commits qui ont une **importance**. Pour ce faire, placez-vous dans le commit que vous souhaitez tagger et exécutez la commande appropriée :

<v-clicks>

* `git tag <version>` - Créer un **lightweight tag**, un simple pointeur vers un commit spécifique.
* `git tag -a <version> -m "<description>"` - Créer un **annotated tag** contenant d'avantages d'informations comme le nom, l'email et la date de l'auteur du tag en plus d'une description si définie.
* `git show <version>` - Affiche le détail des données relatives au tagging d’une version particulière.
* `git tag -a <version> <commit-checksum>` - Créer un **annotated tag** sur le commit avec le checksum `commit-checksum`
* `git push <origin> <tag-version>` - Permet de pusher un tag sur un remote repository
* `git push <origin> --tags` - Permet de pusher tous les tags sur un remote repository
</v-clicks>

---

---
routeAlias: semver
---

<Breadcrumbs />

## SemVer
<Hr />

Lorsque vous créez un logiciel, vous devez être en mesure de suivre son évolution afin de pouvoir continuer à l'utiliser sans risques au fil de son développement.

Une convention est alors apparue pour donner des numéros de version normalisés, **SemVer** (Semantic Versioning).

<p class="text-center">

**MAJOR.MINOR.PATCH** (exemple: `1.4.55`)
</p>

<br />

<v-click>
Lors d'une nouvelle version, incrémentez le numéro de version:
</v-click>

<v-clicks>

* **MAJOR** quand il y a des changements non rétrocompatibles
* **MINOR** quand il y a des ajouts de fonctionnalités rétrocompatibles
* **PATCH** quand il y a des corrections d’anomalies rétrocompatibles
</v-clicks>
