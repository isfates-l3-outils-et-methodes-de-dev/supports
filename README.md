# Repository des slides du cours **Outils et méthodes de développement**

[Les PDFs du cours](https://github.com/isfates-l3-outils-et-methodes-de-dev/supports/tree/pdfs)

<!--
Durée moyenne des cours:

* Docker: 8h
* Git: 4h
* rest-api: 5h
* ci-cd: 3h
* contrôle: 4h
-->

## Développement

Chaque présentations sont situées dans le dossier [slides](./slides/) et sont un projet [slidev](https://sli.dev/).

Pour lancer une présentation en local (par exemple `git`), utilisez la commande `yarn slidev ./slides/git/slides.md`.

## Build

Utilisez une image Docker pour hoster les **PDFs** ainsi que les **slides**:

### Build de l'image

```bash
docker build -t isfates-l3-outils-et-methodes-de-dev-supports  --progress=plain .
```

### Lancement de l'image en local

```bash
docker run -p 8080:80 --name isfates-l3-outils-et-methodes-de-dev-supports --rm isfates-l3-outils-et-methodes-de-dev-supports
```

Ou alors utilisez l'image déjà build:

```bash
docker run -p 8080:80 johannchopin/isfates-l3-outils-et-methodes-de-dev-supports
```
