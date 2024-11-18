# Intégration continue
<Hr />

L’intégration continue fait référence à plusieurs pratiques:

<v-clicks depth="2">

* Construire une version fonctionnelle du système chaque jour
* Exécuter les tests tous les jours
* Committer ses changements régulièrement sur un **dépôt partagé** (Exemple: Git)
* Un système qui observe les changements sur le dépôt et si il
détecte un changement:
  * Récupère une copie du logiciel depuis le dépôt
  * **Compile** et **exécute les tests**
  * Si les tests passent, possibilité de créer une nouvelle release du logiciel
  * Sinon averti le développeur concerné
</v-clicks>

---

<Breadcrumbs />
<Hr />

Une série d'étapes à réaliser lors de la CI se nomme **pipeline**:

<div class="flex justify-center p-4 h-1/4">
  <img src="/images/ci-flow.png" alt="CI flow: https://openclassrooms.com/fr/courses/2035736-mettez-en-place-lintegration-et-la-livraison-continues-avec-la-demarche-devops/8195736-garantissez-la-qualite-de-votre-code-et-packagez-votre-application"/>
</div>

<v-click>
<p class="text-center">
  Mais comment et où faire tourner ces pipelines?
</p>

</v-click>

---

<Breadcrumbs />

## CI Provider
<Hr />

Il existe de nombreuse plate-forme d'intégration continue:

<v-click>
<div class="grid grid-cols-3 gap-4 px-20">
<div class="flex flex-col items-center ">
  <img src="/images/circleci-icon.png" alt="Icone de CircleCI" class="!border-0 h-20"/>

  CircleCI
</div>

<div class="flex flex-col items-center">
  <img src="/images/travisci-logo.png" alt="Icone de TravisCI" class="!border-0 h-20"/>

  TravisCI
</div>

<div class="flex flex-col items-center">
  <img src="/images/netlify-logo.png" alt="Icone de Netlify BUILD" class="!border-0 h-20"/>

  Netlify BUILD
</div>
</div>
</v-click>

<v-click>
<div class="grid grid-cols-2 gap-4 px-40 mt-10">
<div class="flex flex-col items-center ">
  <img src="/images/github-action-logo.png" alt="Icone de GitHub Actions" class="!border-0 h-20"/>

  GitHub Actions
</div>

<div class="flex flex-col items-center">
  <img src="/images/gitlab-ci-cd-logo.png" alt="Icone de Gitlab CI/CD" class="!border-0 h-20"/>

  Gitlab CI/CD
</div>

</div>
</v-click>

---

<Breadcrumbs />

## GitHub Actions
<Hr />

Pour illustrer ce cours, nous utiliserons l'outil GitHub Actions sur un projet d'application Web.


**À vous de jouer:** Faites un fork du projet https://github.com/isfates-l3-outils-et-methodes-de-dev/webapp et clonez-le.

<div class="flex justify-center h-1/4 gap-10 p-4 mt-10">
  <img src="/images/html.png" alt="Logo de HTML" class="!border-0"/>
  <img src="/images/typescript.png" alt="Logo de Typescript" class="!border-0"/>
  <img src="/images/parceljs.png" alt="Logo de ParcelJS" class="!border-0"/>
  <img src="/images/jest.jpg" alt="Logo de Jest" class="!border-0"/>
  <img src="/images/eslint.png" alt="Logo de esLint" class="!border-0"/>
</div>

---

<Breadcrumbs />

### Workflows
<Hr />

<v-clicks>

* L'automatisation des tâches d'une CI se fait via des **workflows**.
* Un workflow est un processus automatisé configurable qui exécutera un ou plusieurs travaux (**jobs**).
* Les workflows sont définis par un fichier YAML archivé dans votre dépôt.
</v-clicks>

<br />

<v-after>

```txt
📂 .github
┣ 📂 workflows
┃ ┗ 📜 ci-pipeline.yaml
┃ ┗ 📜 release.yaml
┃ ┗ 📜 label.yaml
```
</v-after>


---

<Breadcrumbs />

Un workflow doit contenir les 3 composants de base suivants:

<v-clicks>

1. Un ou plusieurs **événements** qui déclenchent le workflow.
2. Un ou plusieurs **jobs**, dont chacun s’exécute sur un ordinateur exécuteur et exécute une série d’une ou plusieurs étapes (**steps**).
3. Chaque étape peut exécuter un script que vous définissez ou une action, qui est une extension réutilisable qui peut simplifier votre workflow.
</v-clicks>


---

<Breadcrumbs />

#### Basique
<Hr />

<div class="grid grid-cols-2 gap-4">

```yaml
name: Linting, Testing, Building
on: push

jobs:
  Linting:
    runs-on: ubuntu-latest
    steps:
      - name: Get Code
        uses: actions/checkout@v3
      - name: Setup environment
        uses: actions/setup-node@v4
      - name: Run Linting Rules
        run: exec lint

  Testing:
    needs: Linting
    runs-on: ubuntu-latest
    steps:
      # ...        
      - name: Run Unit Tests
        run: exec test
```


<v-clicks depth="2">

* `name`: Le nom du workflow. GitHub affiche les noms de vos workflows sous l'onglet **Actions** de votre dépôt.
* `on`: Définit des événements uniques ou multiples qui peuvent déclencher le workflow ou définir un horaire (cronjob).
* `runs-on`: Définit le type de machine sur laquelle le job doit être exécuté.
* `uses`: Sélectionne une action à exécuter dans le cadre d'une step. 
  * Une action est une unité de code réutilisable.
  * Vous pouvez utiliser une action définie dans le même dépôt, dans un dépôt public ou dans une image Docker publiée.
</v-clicks>

</div>

---

<Breadcrumbs />

<div class="flex justify-center p-4 h-3/4">
  <img src="/images/action-example.png" alt="Exemple de GitHub Actions" />
</div>

---

<Breadcrumbs />

#### Utilisation de matrices
<Hr />

Une stratégie matricielle vous permet d'utiliser des variables lors de la définition d'un job afin de créer automatiquement plusieurs jobs basées sur les combinaisons des variables.

```yaml
jobs:
  example_matrix:
    strategy:
      matrix:
        os: [ubuntu-22.04, ubuntu-20.04]
        nodeVersion: [10, 12, 14]
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.nodeVersion }}
```

---

<Breadcrumbs />

#### Utilisation des cronjobs
<Hr />

Vous pouvez utiliser `on.schedule` pour définir un calendrier pour vos workflow en le programmant à l'aide de la syntaxe **POSIX cron**:

```yaml
on:
  schedule:
    # déclenche le workflow tous les jours à 5:30 et 17:30 UTC
    - cron:  '30 5,17 * * *'
```

<v-click>
<div class="mt-10 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-bulb /> GitHub Actions accepte un cronjob de maximum 5 minutes d'intervalle.
</div>
</v-click>

---

<Breadcrumbs />

#### Documentation
<Hr />

<p class="text-center text-sm !mt-20">

  [<mdi-github /> https://docs.github.com/fr/actions/writing-workflows/workflow-syntax-for-github-actions](https://docs.github.com/fr/actions/writing-workflows/workflow-syntax-for-github-actions)
</p>

---

<Breadcrumbs />

### Runners
<Hr />

* ⚠️ Les jobs sur les GitHub-hosted runners sont indépendants, ils démarrent donc dans une image de runner propre et doivent télécharger les dépendances à chaque fois.
* L'utilisation de ces runners sur des dépôts publics est gratuite et illimitée.

<div class="flex justify-center p-4 h-3/5">
  <img src="/images/github-runners.png" alt="Liste des différents GitHub-hosted runners"/>
</div>

---

<Breadcrumbs />

### Exercices
<Hr />

**À vous de jouer:** Ajoutez dans votre projet **webapp** un workflow nommé `Hello CI`:

<v-clicks>

* Celui-ci sera exécuté **lors de chaque push** de code sur le dépot.
* Il aura un unique job basé sur la dernière version du runner `ubuntu` qui exécutera un simple `echo "Hello CI!"`.
* Inspectez le résultat de votre Action de sorte à avoir un résultat similaire:
</v-clicks>

<v-after>
<div class="flex justify-center p-4 h-2/4">
  <img src="/images/action-echo-output.png" alt="Exemple d'ouput d'une action GitHub"/>
</div>
</v-after>

---

<Breadcrumbs />

```yaml {monaco}
#/ Correction





















#
```

<!--
```
name: Hello World
on: push

jobs:
  echo-test:
    runs-on: ubuntu-latest
    steps:
      - name: Print in terminal
        run: echo "Hello CI!"
```
-->

---

<Breadcrumbs />

Modifiez maintenant ce workflow afin de lancer à chaque `push` les jobs `Lint`, `Test` et `Build`.

Chaque job devra:

<v-clicks>

* Récupérer le code du repo (`action/checkout`)
* Setup l'environnement nodejs (`action/setup-node`)
* Installer les dependencies
* Exécuter la commande appropriée
</v-clicks>

<br />

<v-after>

Utilisez cette steps pour installer les dependencies:

```yaml
- name: Load & Cache Dependencies
  uses: ./.github/actions/cached-deps
```
</v-after>

---

<Breadcrumbs />

```yaml {monaco}
#/ Correction





















#
```

<!--
```
name: Linting, Testing, Building

on: push

jobs:
  Linting:
    runs-on: ubuntu-latest
    steps:
      - name: Get Code
        uses: actions/checkout@v3

      - name: Use Node.js 20.9.0
        uses: actions/setup-node@v4
        with:
          node-version: 20.9.0

      - name: Load & Cache Dependencies
        uses: ./.github/actions/cached-deps
        
      - name: Run Linting Rules
        run: npm run lint

  Testing:
    needs: Linting
    runs-on: ubuntu-latest
    steps:
      - name: Get Code
        uses: actions/checkout@v3

      - name: Use Node.js 20.9.0
        uses: actions/setup-node@v4
        with:
          node-version: 20.9.0

      - name: Load & Cache Dependencies
        uses: ./.github/actions/cached-deps
        
      - name: Run Unit Tests
        run: npm run test

  Building:
    needs: Testing
    runs-on: ubuntu-latest
    steps:
      - name: Get Code
        uses: actions/checkout@v3

      - name: Use Node.js 20.9.0
        uses: actions/setup-node@v4
        with:
          node-version: 20.9.0

      - name: Load & Cache Dependencies
        uses: ./.github/actions/cached-deps
        
      - name: Build
        run: npm run build
```
-->

---

<Breadcrumbs />

## Flow de CI
<Hr />

En l'état, la CI ne nous alerte qu'en cas de besoin et ne bloque pas nos actions.

<v-click>

**Comment s'assurer que le code envoyé au dépôt est valide?**
</v-click>

<v-after>
<div class="flex justify-center p-4 h-2/4">
  <img src="/images/gandalf-meme.png" alt="You shall not pass meme"/>
</div>
</v-after>

---

<Breadcrumbs />

### Utilisation de PRs
<Hr />

Il est très simple [avec les PRs](https://github.com/isfates-l3-outils-et-methodes-de-dev/webapp/pulls) de sécuriser la qualité du code.

Voici un exemple dans un flow de trunk-based development:

<div class="flex gap-4 mt-10">

```mermaid {theme: 'base', scale: 0.7}
---
config:
  gitGraph:
    parallelCommits: true
    showCommitLabel: false
---
gitGraph
  commit
  branch release
  branch feature/name-A
  checkout feature/name-A
  commit
  commit
  checkout main
  merge feature/name-A
  checkout release
  merge main tag: "v1.0.0"
  checkout main
  commit
  commit
  checkout release
  merge main tag: "v1.1.0"
```

<div>
<v-clicks>

* La branch trunk est sécurisée et ne peut recevoir de commits en dehors d'une PR
* Chaque PRs doivent exécuter la CI
  * soit à chaque push
  * soit lors d'une action manuelle
* Une PR ne peut être mergée dans la branch trunk sans avoir une CI validée
</v-clicks>
</div>
</div>
