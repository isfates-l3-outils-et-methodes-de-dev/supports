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
  <img src="/images/postman.png" alt="Icone de postman"  class="h-2/5 !border-0"/>
  <img src="/images/readme-brand-icon.png" alt="Icone de Readme"  class="w-2/5 !border-0"/>
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

Pour éviter la duplication du code, vous pouvez placer les définitions communes dans la section global `components` et les référencer à l'aide de `$ref`:

```yaml
paths:
  /users:
    post:
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/User'

components:
  schemas:
    User:
      type: object
      properties:
        id:
          type: integer
        name:
          type: string
```

---

<Breadcrumbs />

#### Définition de Schémas
<Hr />

Le type de données d'un schéma est défini par le mot-clé `type`:

<div class="text-sm">

* `string` (cela comprend les dates et les fichiers)
* `number`
* `integer`
* `boolean`
* `array`
* `object`
</div>

<v-click>

Exemple:

<div class="grid grid-cols-2 gap-10">

```yaml
User:
  type: object
```

```yaml
User:
  oneOf:
    - type: string
    - type: object
```
</div>

<p class="text-right text-sm">

https://swagger.io/docs/specification/data-models/data-types
</p>
</v-click>

---

<Breadcrumbs />

Les tableaux sont définis de la sorte:

<div class="grid grid-cols-2 gap-10">

```yaml
Users:
  type: array
  items:
    type: string
```

```yaml
Users:
  type: array
  items:
    oneOf:
      - type: string
      - type: integer
```
</div>

Vous pouvez définir la longueur minimale et maximale d'un tableau à l'aide de `minItems` et `maxItems`.

```yaml
Users:
  type: array
  items:
    type: string
  minItems: 1
  maxItems: 10
```

---

<Breadcrumbs />

Un objet est une collection de paires **propriété**/**valeur**:

```yaml
User:
  type: object
  properties:
    id:
      type: integer
    name:
      type: string
    contact_info:
      type: object
      properties:
        email:
          type: string
          format: email
  required:
    - id
```

Par défaut, toutes les propriétés des objets sont **optionnelles**. Vous pouvez spécifier les propriétés requises dans la liste `required`.

---

<Breadcrumbs />

Utilisez le mot-clé `enum` pour spécifier les valeurs possibles d'un type `string`:

```yaml
#/ GET /users?sort=[asc|desc]

paths:
  /users:
    get:
      parameters:
        - in: query
          name: sort
          description: Sort order
          schema:
            type: string
            enum:
              - asc
              - desc
```

<v-click>
<div class="mt-5 bg-green-100 border border-green-400 text-green-700 px-4 rounded relative text-xs" role="alert">

💡 Il est fortement recommendé de placer les `enum`s dans la section globale `components.schemas`.
</div>
</v-click>

---

<Breadcrumbs />

OpenAPI 3.0 fournit plusieurs mots-clés que vous pouvez utiliser pour combiner des schémas. 

Vous pouvez utiliser ces mots-clés pour créer un schéma complexe ou pour valider une valeur en fonction de plusieurs critères.

<v-clicks>

* `oneOf` - valide la valeur par rapport à un seul des sous-schémas
* `allOf` - valide la valeur par rapport à tous les sous-schémas
* `anyOf` - valide la valeur par rapport à n'importe quel sous-schéma (un ou plusieurs)
</v-clicks>

---

<Breadcrumbs />

Exemple d'utilisation:

<div class="grid grid-cols-2 gap-10">

```yaml
paths:
  /pets:
    patch:
      requestBody:
        content:
          application/json:
            schema:
              oneOf:
                - $ref: '#/components/schemas/Cat'
                - $ref: '#/components/schemas/Dog'
```

```yaml
components:
  schemas:
    Pet:
      type: object
      # ...
    Dog:
      allOf:
        - $ref: '#/components/schemas/Pet'
        - type: object
          # ...
    Cat:
      allOf:
        - $ref: '#/components/schemas/Pet'
        - type: object
          # ...
```
</div>


---

<Breadcrumbs />

#### Authentification
<Hr />

OpenAPI utilise le terme **chéma de sécurité** pour les schémas d'authentification et d'autorisation. Les types gérés sont:

<v-clicks>

* `http` - pour les authentifications Basic, Bearer et autres schémas d'authentification HTTP
* `apiKey` - pour les clés d'API et l'authentification par cookie
* `oauth2` - pour OAuth 2
* `openIdConnect` - pour OpenID Connect
</v-clicks>

<br />

<v-click>

Tous les schémas de sécurité utilisés par l'API doivent être définis dans la section global `components/securitySchemes`.
</v-click>

---

<Breadcrumbs />

Exemple pour une authentification à l'aide d'un Bearer token:

```yaml
paths:
  /users:
    post:
      security:
        - bearerAuth: []
      # ...

components:
  securitySchemes:
    bearerAuth: # nom arbitraire
      type: http
      scheme: bearer
      bearerFormat: JWT 
```

<div class="flex justify-center h-1/4 p-4">
  <img src="/images/swagger-auth.png" alt="Visuel de l'authentification dans swagger" class="!borer-0" />
</div>

---

<Breadcrumbs />

## Exercice
<Hr />

Définissez à l'aide d'un document **OAS** une API RESTful permettant de:

<div class="text-sm">
<v-clicks depth="2">

* **1. Récupérer la liste d'une ressource de votre choix**.
  * La liste peut être paginée par `page` avec un nombre `per-pages` qui peut être défini (veuillez leur donner une **description**).
  * La liste sera typée et fournira un exemple.
* **2. Ajouter une ressource à cette liste**
  * Ce point d'accès doit être protégé par une authentification utilisant un Bearer token JWT
* **3. Modifier une ressource** 
  * Assurez-vous que vous détaillez ce que vous devez utiliser comme paramètre dans le path
  * Ce point d'accès doit être protégé par une authentification utilisant un Bearer token JWT
* Assurez-vous de ne pas dupliquer les données des schémas.
* L'API ne prendra en charge que le type de média JSON.
* Documentez les différents codes de statut qui peuvent être retournés par vos endpoints (**404**, **500**, ...).
</v-clicks>
</div>

<!--
openapi: 3.0.3
info:
  title: My API - OpenAPI 3.0
  version: "1.0.0"
servers:
  - url: https://my-api.com/v1
    description: Main production server

paths:
  "/users":
    get:
      summary: List users
      operationId: getUsers
      parameters:
      - "$ref": "#/components/parameters/per-page"
      - "$ref": "#/components/parameters/page"
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                type: array
                items:
                  "$ref": "#/components/schemas/User"
        '500':
          "$ref": "#/components/responses/internal_server_error"
    post:
      summary: Create an user
      operationId: CreateUser
      security:
        - bearerAuth: []
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/UserCreation"
      responses:
        '201':
          description: Created
          content:
            application/json:
              schema:
                "$ref": "#/components/schemas/User"
        '404':
          "$ref": "#/components/responses/not_found"
        '403':
          "$ref": "#/components/responses/forbidden"
        '500':
          "$ref": "#/components/responses/internal_server_error"
  "/users/{id}":
    put:
      summary: Edit an user
      operationId: EditUser
      security:
        - bearerAuth: []
      parameters:
        - in: path
          name: id
          schema:
            type: integer
          required: true
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: "#/components/schemas/UserCreation"
      responses:
        '204':
          "$ref": "#/components/responses/no_content"
        '403':
          "$ref": "#/components/responses/forbidden"
        '500':
          "$ref": "#/components/responses/internal_server_error"

components:
  schemas:
    UserCommon:
      type: object
      properties:
        name:
          type: string
          example: johannchopin
        contact_info:
          type: object
          properties:
            email:
              type: string
              format: email
              example: e@mail.com
    UserCreation:
      allOf:
        - $ref: "#/components/schemas/UserCommon"
    User:
      allOf:
        - $ref: "#/components/schemas/UserCommon"
        - type: object
          properties:
            id:
              type: integer
          required:
            - id
  parameters:
    per-page:
      name: per_page
      description: The number of results per page (max 100).
      in: query
      schema:
        type: integer
        default: 30
        maximum: 100
    page:
      name: page
      description: The page number of the results to fetch.
      in: query
      schema:
        type: integer
        default: 1
  responses:
    not_found:
      description: Resource not found
    forbidden:
      description: Forbidden due to lack of permission
    internal_server_error:
        description: Internal Server Error
    no_content:
        description: No Content
  securitySchemes:
    bearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
-->