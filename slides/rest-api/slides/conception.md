# Conception d'APIs REST
<Hr />

Nous avons vu comment utiliser une API externe, voyons maintenant comment documenter nous-même une API REST.

<div class="flex justify-center h-3/5 p-4">
  <img src="/images/document-api.png" alt="API meme: https://bootcamp.uxdesign.cc/design-the-user-experience-of-an-api-a150bdbd1ffa" class="!border-0" />
</div>

---

<Breadcrumbs />

## Qu'est-ce qu'une documentation API ?
<Hr />

* La documentation de l'API est un **ensemble d'instructions lisibles par l'Homme (et la machine)** pour l'utilisation et l'intégration d'une API.

<br />

<v-clicks depth="2">

* La documentation de l'API comprend:
  * des informations détaillées sur les endpoints
  * les méthodes
  * les ressources
  * les protocoles d'authentification
  * les paramètres
  * les headers
  * des exemples de requêtes et de réponses.
</v-clicks>


---

<Breadcrumbs />

Mais comment partagez une telle documentation?

<div class="grid grid-cols-3 items-center gap-4 h-3/5">

<v-clicks>
  <div class="flex flex-col items-center">
  <img src="/images/markdown-icon.png" alt="Icone de markdown" class="h-30 !border-0"/>
  </div>

  <div class="flex flex-col items-center">
  <img src="/images/postman.png" alt="Photo de Gitkraken"  class="h-2/5 !border-0"/>
  <img src="/images/readme-brand-icon.png" alt="Photo de Gitkraken"  class="w-2/5 !border-0"/>
  </div>

  <img src="/images/openapi-icon.png" class="!border-0" alt="Photo de fork"/>
</v-clicks>
</div>

---

<Breadcrumbs />

## OpenAPI
<Hr />

<v-clicks>

* Les descriptions d'API lisibles par machine sont aujourd'hui omniprésentes et OpenAPI est **la norme industrielle** la plus largement adoptée pour décrire les nouvelles API.
* La spécification OpenAPI (**OAS**) permet de décrire une API distante accessible via HTTP ou des protocoles de type HTTP. Cette description, qui peut être stockée sous la forme d'**un ou de plusieurs documents JSON ou YAML**, est appelée description OpenAPI (**OAD**).
</v-clicks>

<v-after>
<div class="flex justify-center h-3/5 p-4">
  <img src="/images/openapi-file.png" alt="Fichier OpenAPI: https://idratherbewriting.com/learnapidoc/pubapis_openapi_tutorial_overview.html" />
</div>
</v-after>

---

<Breadcrumbs />

<br />
<div class="text-sm">
<v-clicks depth="2">

* La description d'une API dans un format lisible par une machine permet aux outils automatisés de la traiter :
  * **Validation de la description et linting :** Vérifier que votre fichier de description est syntaxiquement correct et qu'il respecte une version spécifique de la spécification ainsi que les directives de formatage du reste de votre équipe.
  * **Validation des données :** Vérifier que les données qui transitent par votre API sont correctes, pendant le développement et une fois déployées.
  * **Génération de documentation :** Création d'une documentation traditionnelle lisible par l'homme, basée sur la description lisible par la machine.
  * **Génération de code :** Créez le code du serveur et du client dans n'importe quel langage de programmation, ce qui évite aux développeurs d'avoir à effectuer la validation des données ou à écrire le code du SDK, par exemple.
  * **Mock Servers :** Créez des serveurs mockés fournissant des exemples de réponses que vous et vos clients pouvez commencer à tester avant d'écrire une seule ligne de code.
  * **Analyse de sécurité :** Découvrez les éventuelles vulnérabilités dès la phase de conception de l'API, plutôt que beaucoup, beaucoup plus tard.  
</v-clicks>
</div>

---

<Breadcrumbs />

<div class="mt-5 bg-green-100 border border-green-400 text-green-700 px-4 rounded relative text-xs" role="alert">

🔓 OAS est une spécification au format non propriétaire. 
</div>

<br />

<v-clicks>

* Elle était à l'origine basé sur la spécification **Swagger 2.0**, donnée par SmartBear Software en 2015.
* Actuellement, l'OAS est maintenu, développé et promu par l'OpenAPI Initiative (**OAI**), un consortium d'experts industriels doté d'une structure de gouvernance ouverte sous la tutelle de **la Fondation Linux**. 
* Toutes **les réunions et décisions sont publiques** et les modifications de l'OAS peuvent être proposées et discutées par **tout le monde**. 
</v-clicks>

---

<Breadcrumbs />

### Spécification
<Hr />

Apprenons la syntaxe d'**OAS** en utilisant l'éditeur en ligne https://editor-next.swagger.io.

<br />

* Remplissez la configuration minimale pour un document **OAS** au format YAML:

```yml
openapi: 3.0.3
info:
  title: My API - OpenAPI 3.0
  version: 0.0.1
paths: {} # No endpoints defined
```

---

<Breadcrumbs />

#### Métadonnées
<Hr />

* Chaque définition d'API doit inclure la version OAS sur laquelle cette définition est basée :

```yaml
openapi: 3.0.3 # Suit la norme SemVer
```
<br />

<v-clicks depth="2">

* La section `info` contient des informations sur l'API : 
  * `title`: Nom de l'API
  * `description` (optionnelle): Complément d'information sur l' API au format text ou markdown
  * `version`:  Chaîne de caractères arbitraire qui spécifie la version de l'API
</v-clicks>

<br />

<v-click>

**À vous de jouer:** Remplissez les métadonnées comme si vous étiez éditeur de l'API de GitHub.
</v-click>


---

<Breadcrumbs />

#### Serveurs
<Hr />

* La section `servers` spécifie le serveur API et l'URL de base. Vous pouvez définir un ou plusieurs serveurs, tels que production et sandbox:

```yaml
servers:
  - url: http://api.example.com/v1
    description: Optional server description, e.g. Main (production) server
  - url: http://staging-api.example.com
    description: Optional server description, e.g. Internal staging server for testing
```
<br />

<v-click>

* Tous les endpoints de l'API sont relatifs à l'URL du serveur
</v-click>

---

<Breadcrumbs />

#### Endpoints
<Hr />

La section `paths` définit **les endpoints** de votre API et **les méthodes HTTP** prises en charge:

```yaml
paths:
  /users:
    get:
      # ...
    post:
      # ...
```

<br />

OpenAPI 3.0 prend en charge les méthodes `get`, `post`, `put`, `patch`, `delete`, `head`, `options` et `trace`.

<!--
* La méthode HTTP TRACE effectue un test de message en boucle le long du chemin menant à la ressource cible, ce qui constitue un mécanisme de débogage utile.
-->
---

<Breadcrumbs />

Les endpoints peuvent être accompagnés d'un court `summary` facultatif et d'une `description` plus longue à des fins de documentation. 

```yaml
paths:
  /users:
    get:
      summary: Get all the users
      description: Get the complete list of users ordered by creation date
      parameters:
        # ...
      responses:
        # ...
```

---

<Breadcrumbs />

#### Paramètres
<Hr />

Il est possible de décrire un paramètre, en indiquant son nom (`name`), son emplacement (`in`), son type de données (`schema`) et d'autres attributs, tels que `description` ou `required`.

```yaml
paths:
  /users/{userId}:
    get:
      summary: Get a user by ID
      parameters:
        - in: path
          name: userId
          schema:
            type: string
          required: true
          description: Numeric ID of the user to get
```

<v-click>

`in` peut contenir la valeur `path`, `header`, `query` ou `cookie`.

`type` peut contenir la valeur `string`, `number`, `integer`, `boolean`, `array` ou `object`.
</v-click>

---

<Breadcrumbs />

**À vous de jouer:** Documentez l'endpoint de l'API GitHub `GET /users/{username}/gists`, de sorte à lister tous les paramètres du **path** ainsi que des **query strings**.

---

<Breadcrumbs />

#### Request Body
<Hr />

Il est possible de décrire très précisement le body attendu d'une requête:

```yaml
paths:
  /users:
    post:
      summary: Add a new user
      requestBody:
        description: Optional description in *Markdown*
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/User'
          application/xml:
            schema:
              $ref: '#/components/schemas/User'
          application/x-www-form-urlencoded:
            schema:
              $ref: '#/components/schemas/UserForm'
```

<!--
* content énumère les types de médias 
-->

---

<Breadcrumbs />

#### Définition de Schémas
<Hr />