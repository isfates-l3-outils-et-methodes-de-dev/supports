# Livraison continue
<Hr />

La livraison continue est la suite logique de l’intégration continue.

Il s'agit d'une discipline où l’application est construite de manière à pouvoir être mise en production à n’importe quel moment.


<v-click>

**Livraison continue !== déploiement continu**
<div class="flex justify-center p-4 h-2/4">
  <img src="/images/cd-vs-cd.jpg" alt="Livraison continue !== déploiement continu: https://blog.crisp.se/2013/02/05/yassalsundman/continuous-delivery-vs-continuous-deployment"/>
</div>
</v-click>

---

<Breadcrumbs />

## Flow de CD
<Hr />

<v-clicks depth="2">

* **Une simple action manuelle**
  * Une interface avec un bouton de mise en production
  * Une commande à lancer sur un serveur
* **Une automation sur le dépôt**
  * Lors d'un merge sur une branche spécifique
  * Lors de la création d'un nouveau tag
  * Lors d'une Release (exemple de [GitHub Releases](https://docs.github.com/fr/repositories/releasing-projects-on-github/about-releases))
</v-clicks>

---

<Breadcrumbs />

## PaaS et IaaS
<Hr />

La livraison continue se met généralement en place à l'aide d'une **Platform as a Service** ou même une **Infrastructure as a Service**.

<v-clicks>

* **Rentabilité**: Pas besoin d'acheter du matériel ou de payer des frais pendant les temps d'arrêt
* **Gain de temps**: Pas besoin de passer du temps à mettre en place/maintenir la pile de base
* **Rapidité de mise sur le marché**: Accélération de la création d'applications
* **Future-Proof**: Accès à un datacenter et à des systèmes d'exploitation toujours à jours
* **Amélioration de la sécurité**: Les fournisseurs de PaaS investissent massivement dans la technologie et l'expertise en matière de sécurité.
* **Évolution dynamique**: Augmentation rapide de la capacité en période de pointe
* **Flexibilité**: Permet aux employés de se connecter et de travailler sur les applications depuis n'importe où.
</v-clicks>

---

<Breadcrumbs />

<v-click>

Exemples de **PaaS**:
<div class="grid grid-cols-4 gap-2 px-10 mt-10">
  <img src="/images/windows-azure.png" alt="Logo de Windows Azure" class="!border-0 h-2/5"/>
  <img src="/images/heroku.jpg" alt="Logo de Heroku" class="!border-0 h-2/5"/>
  <img src="/images/vercel.png" alt="Logo de Vercel" class="!border-0 h-2/5"/>
  <img src="/images/openshift.png" alt="Logo de OpenShift" class="!border-0 h-2/5"/>
</div>
</v-click>


<v-click>

Exemples de **IaaS**:
<div class="grid grid-cols-3 gap-2 px-30 mt-10">
  <img src="/images/aws.png" alt="Logo de AWS" class="!border-0 h-2/5"/>
  <img src="/images/digitalocean.png" alt="Logo de DigitalOcean" class="!border-0 h-2/5"/>
  <img src="/images/linode.png" alt="Logo de Linode" class="!border-0 h-2/5"/>
</div>
</v-click>


---

<Breadcrumbs />

## Exercice
<Hr />

**À vous de jouer:** Nous allons dans un premier temps isolez le workflow `Build` dans un fichier dédié de sorte à pouvoir facilement le réutiliser.


1. Isolez le workflow dans un fichier `build.yaml`.
2. Il s'exécutera lors d'un simple appel (`workflow_call`).
3. Il devra rendre accessible le contenu du dossier généré `dist` aux autres workflow (regardez voir l'action `actions/upload-artifact`).
4. Réutilisez le workflow dans votre CI.

---

<Breadcrumbs />

```yaml {monaco}
#/ Correction





















#
```


<!--
build.yaml

```
name: Building

on: workflow_call

jobs:
  Building:
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
      
      - name: Upload dist folder for other jobs
        uses: actions/upload-artifact@v4
        with:
          name: dist-folder
          path: dist
```

Reuse job using:
```
jobs:
  Building:
    uses: ./.github/workflows/build.yaml
```
-->

---

<Breadcrumbs />

Ajoutons maintenant un Workflow de `Release` qui deploiera automatiquement notre Web Application.

Pour ce faire, nous utiliserons le service d'hébergement statique **GitHub Pages** et sa GitHub Actions dédiée:

<div class="flex justify-center p-4 h-3/5">
  <img src="/images/github-pages.png" alt="Screenshot GitHub Pages"/>
</div>

---

<Breadcrumbs />

**À vous de jouer:** Ajoutez un nouveau workflow `Release`:

<v-clicks depth="2">

1. Il devra s'exécuter lors de la création d'un tag suivant la syntaxe SemVer (`v[0-9]+.[0-9]+.[0-9]+`)
2. Il sera composé de 2 jobs `Build` et `Deploy`
3. Le job `Deploy` 
   1. fera appel à l'action `actions/download-artifact` pour récupérer le dossier `dist` 
   2. enverra son contenu à l'aide de l'action `actions/upload-pages-artifact` et
   3. déploiera le site statique à l'aide de `actions/deploy-page`
</v-clicks>

<v-click>
<div class="flex justify-center p-4 h-2/5">
  <img src="/images/cd-pipeline.png" alt="Screenshot de la pipeline de release"/>
</div>
</v-click>

---

<Breadcrumbs />

```yaml {monaco}
#/ Correction





















#
```


<!--
release.yaml

```
name: Release

on:
  push:
    tags:
      - 'v[0-9]+.[0-9]+.[0-9]+'

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  Building:
    uses: ./.github/workflows/build.yaml

  Deploy:
    needs: Building
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Download build dist folder
        uses: actions/download-artifact@v4
        with:
          name: dist-folder
          path: './dist'
      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          # Upload dist directory
          path: './dist'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```
-->
