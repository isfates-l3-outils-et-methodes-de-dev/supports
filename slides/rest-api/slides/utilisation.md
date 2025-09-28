# Utilisation d'APIs REST
<Hr />

<div class="flex justify-center h-3/5 p-4 mt-10">
  <img src="/images/openAPI-illustration.png" alt="OpenAPI illustration: https://www.moesif.com/blog/technical/api-design/Benefits-of-using-the-OpenAPI-Swagger-specification-for-your-API/" />
</div>

---

<Breadcrumbs />

Il existe actuellement de nombreux outils facilitant la conception, la documentation, le débogage, la simulation et les tests sur de APIs:

<div class="grid grid-cols-4 gap-4 items-center">
  <img src="/images/postman.png" alt="Photo de Postman" class="!border-0"/>
  <img src="/images/insomnia.png" alt="Photo de Insomnia" class="!border-0"/>
  <img src="/images/apidog.png" alt="Photo de Apidog" class="!border-0"/>
  <img src="/images/hoppscotch.png" alt="Photo de Hoppscotch" class="!border-0"/>
</div>

<v-click>

Dans les documentations, vous verrez souvent une commande [curl](https://everything.curl.dev/index.html) comme référence:

```bash
curl -L \
  -X DELETE \
  -H "Accept: application/json" \
  -H "Authorization: Bearer token" \
  https://api.com/collections/ressource \
  -d '{"key": "value"}'
```
</v-click>

<!--
* -L : Follow redirect
* -X : Specify request command to use
* -d : data
-->
---

<Breadcrumbs />

## Découverte de Postman
<Hr />

Créez vous un compte sur **Postman**.

<div class="flex justify-center h-3/5 p-4">
  <img src="/images/postman-screenshot.png" alt="Screenshot de Postman" />
</div>

<p class="text-center">

https://web.postman.co/
</p>

---

<Breadcrumbs />

Nous allons faire nos premiers pas avec Postman en utilisant l'API REST de GitHub.

<p class="text-center">

<mdi-open-in-new /> https://docs.github.com/fr/rest
</p>

<v-click>
<div class="mt-10 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 rounded relative text-xs" role="alert">

⚠️ L'API de GitHub possède de très nombreuses features. Nous nous concentrerons sur les endpoints des [**utilisateurs**](https://docs.github.com/fr/rest/users) ainsi que les [**gists**](https://docs.github.com/fr/rest/gists)
</div>
</v-click>


---

<Breadcrumbs />

### Exécution d'une requête
<Hr />

**À vous de jouer:** Récupérez via API vos informations de votre profile GitHub.

<br />

<v-clicks>

1. Quel endpoint devez-vous appeler pour récupérer les informations de votre utilisateur ?
2. Ajoutez cette requête à Postman et exécutez-la.
3. Analyse de la requête et de sa réponse.
4. Appelez la requête en demandant une réponse au format `xml`.
</v-clicks>

<br />

<v-click>

```json
{
  "message": "Unsupported 'Accept' header: 'application/xml'. Must accept 'application/json'.",
  "documentation_url": "https://docs.github.com/v3/media",
  "status": "415"
}
```
</v-click>

<!--
* 1. GET https://api.github.com/users/USERNAME
* 3. Accept: application/xml
* Status 415: Unsupported Media Type
-->

---

<Breadcrumbs />

### Collections
<Hr />

Dans Postman, les **collections** constituent le standard permettant l'**organisation des APIs**. Grâce aux collections, vous pouvez lier des éléments d'API apparentés pour faciliter l'édition, le partage, le test et la réutilisation.


<div class="flex justify-center h-2/4 p-4 -mt-5">
  <img src="/images/postman-collection.png" alt="Screenshot d'une collection dans Postman" />
</div>

<v-click>

**À vous de jouer:** Déplacez votre requête dans une collection nommée, dans un sous dossier portant le nom de la collection REST.
</v-click>

---

<Breadcrumbs />

### Exemple de réponse
<Hr />

* Les exemples montrent les endpoints de votre API en action et donnent plus de détails sur le fonctionnement des requêtes et des réponses.
* Vous pouvez ajouter un exemple à une requête en enregistrant une réponse, ou vous pouvez créer un exemple avec une réponse personnalisée pour illustrer un cas d'utilisation spécifique.

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/postman-example.png" alt="Screenshot d'un Gist" />
</div>

<v-click>

**À vous de jouer:** Ajoutez un exemple à votre requête illustrant une réponse **404**. L'utilisateur `__unknown__` n'existe pas encore.
</v-click>

---

<Breadcrumbs />

### Variables et environnements
<Hr />

* Les variables permettent de stocker et de réutiliser des valeurs dans Postman.
* En stockant une valeur en tant que variable, il est possible de la référencer dans des collections, environnements, requêtes et scripts.

<v-click>

**Exemple:** Si vous avez le même URL dans plusieurs requête, mais que l'URL peut changer ultérieurement, vous pouvez stocker l'URL dans une variable `base_url` et y faire référence à l'aide de la syntaxe entre doubles crochets `{{base_url}}`.

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/postman-variable.png" alt="Screenshot d'une variable Postman" />
</div>
</v-click>

---

<Breadcrumbs />

Chacune des variables possèdent une **valeur initiale** et une **valeur courante** :

<v-clicks>

* La **valeur initiale** est une valeur synchronisée avec les serveurs de Postman et peut donc être partagée avec l'équipe.
*  La **valeur courante** est utilisée lors de l'envoi d'une requête. Il s'agit de valeurs locales, qui ne sont pas synchronisées avec les serveurs de Postman. 
</v-clicks>

---

<Breadcrumbs />

<v-clicks>

* Il est possible de regrouper des variables dans différents **environnements**.
* Lorsque vous passez d'un environnement à l'autre, toutes les variables de vos requêtes et de vos scripts utilisent les valeurs de l'environnement actuel.
* Cela est utile pour utiliser des valeurs différentes fonction du contexte: serveur de test ou serveur de production.
</v-clicks>


<v-after>
<div class="flex justify-center h-3/5 p-4">
  <img src="/images/postman-envs.png" alt="Screenshot de la selection d'un environnement dans Postman" />
</div>
</v-after>

---

<Breadcrumbs />

<div class="flex justify-center h-4/5 p-4 mt-10">
  <img src="/images/postman-variables-scope.png" alt="Scope des variable Postman" class="!border-0" />
</div>

---

<Breadcrumbs />

**À vous de jouer:**
<v-clicks depth="2">

1. Créez une variable dans votre collection contenant votre nom d'utilisateur.
2. Utilisez cette variable dans votre requête `GET /users/{id}`.
3. Modifiez sa valeur courante pour recupérer les informations d'un autre utilisateur.
4. Définir 2 environnements `github-api-test` et `github-api-test`:
   1. Y ajouter une variable `version`, l'une sera la dernière version de l'API et l'autre sera une fausse version (Consultez la documentation sur la version de l'API GitHub: https://docs.github.com/fr/rest/about-the-rest-api/api-versions).
   2. Utiliser cette variable dans votre requête de sorte à pouvoir définir qu'elle version d'API utiliser.
</v-clicks>

---

<Breadcrumbs />

### Envoi de données
<Hr />

<div class="flex justify-center h-3/5 p-4">
  <img src="/images/action-meme.png" alt="Meme de Yoda qui veut de l'action" />
</div>


<v-click>

Utilisons la section Body d'une requête dans Postman.
</v-click>

---

<Breadcrumbs />

Nous allons utilisez l'API liés aux Gists dans GitHub: `/gists`.
<v-click>

Gist est un service de GitHub permettant de simplement partager des snippets de code avec d'autres personnes.

<div class="flex justify-center h-2/5 p-4">
  <img src="/images/gist.png" alt="Screenshot d'un Gist" />
</div>
</v-click>

---

<Breadcrumbs />

**À vous de jouer:**
<v-clicks depth="2">

1. Créez un simple gist au format markdown depuis l'interface de GitHub: https://gist.github.com
2. Ajoutez dans Postman un nouveau **Dossier** contenant une requête appelant la liste des gists de votre utilisateur.
3. Ajoutez une requête permettant de créer un nouveau **gist public** au format markdown.
4. Exécutez la requête. Vous devriez recevoir une erreur **401**.
</v-clicks>

<!--
* `GET /users/{username}/gists`

* `POST /gists`

```
{
    "public": true,
    "files": {
        "just-a-gist.md": {
            "content": "# Hello from the API"
        }
    }
}
```
-->

---

<Breadcrumbs />

## Authentification et autorisation
<Hr />

<v-clicks>

* L'**authentification** API permet de vérifier l'identité d'un utilisateur afin qu'il puisse accéder à une API.
* L'**autorisation** permet de définir ce à quoi un utilisateur peut ou ne peut pas accéder.
</v-clicks>

<v-after>
<div class="flex justify-center h-3/5 p-4">
  <img src="/images/authentication-vs-authorization.png" alt="authentification vs autorisationt" />
</div>
</v-after>

---

<Breadcrumbs />

L'authentification est utilisée pour :

* Vérifier l'identité d'un client ou d'un utilisateur.
* Permettre aux clients et utilisateurs autorisés d'accéder à une API.
* Empêcher tout accès non autorisé.

<br />

<v-click>

L'autorisation est utilisée pour :

* Accorder l'**accès et l'exposition à des ressources** ou des données particulières pour différents utilisateurs.
* Régir les actions que les différents utilisateurs et clients peuvent effectuer avec une API.
* Appliquer les politiques de contrôle d'accès définies.
</v-click>

---

<Breadcrumbs />

**À vous de jouer:** Quelles codes HTTP conviendraient pour une erreur d'authentification et une erreur d'autorisation?

<v-click>

| Code    | Message      | Description                                                                                                                    |
|---------|--------------|--------------------------------------------------------------------------------------------------------------------------------|
| **401** | Unauthorized | Une authentification est nécessaire pour accéder à la ressource.                                                               |
| **403** | Forbidden    | Le serveur a compris la requête, mais refuse de l'exécuter car  les droits d'accès ne permettent pas d'accéder à la ressource. |
</v-click>

---

<Breadcrumbs />

Il existe quatre façons principals de mettre en œuvre l'authentification dans une API REST :
<v-clicks>

* Basic Authentication
* API Keys
* Token-Based Authentication
* OAuth 2.0
</v-clicks>

---

<Breadcrumbs />

### Basic Authentication
<Hr />

* Basic Authentication est un schéma d'authentification simple **intégré au protocole HTTP**.
* Le client envoie des requêtes HTTP avec le header `Authorization` qui contient le mot `Basic` suivi d'un espace et d'une chaîne de charactères `username:password` encodée en base64.
* Exemple de header: `Authorization: Basic ZGVtbzpwQDU1dzByZA==`

<v-click>
<div class="mt-10 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative text-xs" role="alert">
<mdi-alert-circle /> Comme le base64 est facilement décodé, l'authentification de base ne devrait être utilisée qu'avec d'autres mécanismes de sécurité tels que HTTPS/SSL.
</div>
</v-click>

---

<Breadcrumbs />

### API Keys
<Hr />

Une clé API est un token (jeton) que le client fournit lorsqu'il effectue des appels API.
Il s'agit d'une longue chaîne alphanumérique identifiant de manière unique un client ou une application accédant à une API.

<v-click>

* La clé peut être envoyée via une query string :

```
GET /collections?api_key=abcdef12345
```
</v-click>

<v-click>

* ou en tant que header d'une requête :

```
GET /something HTTP/1.1
X-API-Key: abcdef12345
```
</v-click>

<v-click>

* ou en tant que cookie HTTP :

```
GET /something HTTP/1.1
Cookie: X-API-KEY=abcdef12345
```
</v-click>

<!--
* Un cookie (également connu sous le nom de cookie web ou cookie de navigateur) est un petit élément de données qu'un serveur envoie au navigateur web d'un utilisateur. Le navigateur peut stocker des cookies, en créer de nouveaux, modifier des cookies existants et les renvoyer au même serveur lors de demandes ultérieures. 
-->

---

<Breadcrumbs />

<div class="mt-10 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-alert-circle /> Les clés API sont censées être un secret que seuls le client et le serveur connaissent. Comme la Basic Authentication, l'authentification basée sur les clés API n'est considérée comme sûre que si elle est utilisée avec d'autres mécanismes de sécurité tels que HTTPS/SSL.
</div>

<br />

<v-clicks>

* 👍 L'authentification par API key est d'une grande simplicité. La méthode utilise une clé unique qui permet de s'authentifier simplement en incluant la clé.
* 👍 L'authentification par API key est très répandue. 
* 👎 Si la clé est rendue publique, quelqu'un peut se faire passer pour vous
* 💡 Il s'agit d'un moyen simple de gérer l'authentification pour les API qui n'ont pas besoin d'autorisations d'écriture, tout en limitant les risques.
</v-clicks>

---

<Breadcrumbs />

### Token-Based Authentication
<Hr />

<v-clicks>

* Un système d'authentification HTTP qui implique des tokens de sécurité appelés **bearer tokens**.
* Le bearer token est une **chaîne cryptée**, généralement générée par le serveur en réponse à une demande de connexion.
* Le client doit envoyer ce token dans le header `Authorization` lorsqu'il demande des ressources protégées:
</v-clicks>

<v-after>

```
Authorization: Bearer <token>
```
</v-after>

<v-click>
<div class="mt-10 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative text-xs" role="alert">

<mdi-bulb /> Dans le domaine du développement web, les « web tokens » font presque toujours référence aux JWTs (**JSON Web Token**).
</div>
</v-click>

---

<Breadcrumbs />

#### JWT
<Hr />

* JSON Web Token (JWT) est une **norme ouverte** (RFC 7519) qui définit un moyen compact et autonome de transmettre en toute sécurité des informations entre des parties sous la forme d'un objet JSON.
* Ces informations sont vérifiables et fiables car elles sont signées numériquement.

<v-click>

<div class="flex justify-center h-65">
  <img src="/images/jwt.png" alt="Structure d'un JWT: https://supertokens.com/blog/what-is-jwt" class="!border-0" />
</div>

<p class="text-center -pt-10">

<mdi-open-in-new /> https://jwt.io
</p>
</v-click>

<!--
* Header et payload encodé en Base64Url
-->

---

<Breadcrumbs />

⚠ Bien qu'un JWT **soit protégées contre la falsification**, ses données sont lisibles par n'importe qui. Ne mettez **pas d'informations secrètes** dans le payload ou header d'un JWT, à moins qu'elles ne soient cryptées.

<v-clicks>

* Dans certains cas, JWT permet de mettre en place un mécanisme d'autorisation sans état. 
* Les routes protégées du serveur vérifieront la présence d'un **JWT valide (vérification de la signature)**. 
* Si le JWT contient les données nécessaires, la nécessité d'interroger la base de données pour certaines opérations peut être réduite.
</v-clicks>

<v-click>
<div class="mt-10 bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 rounded relative text-xs" role="alert">

Veiller à ce qu'un token JWT ne soient **pas trop volumineux** si vous l'envoyez par le biais d'un header HTTP. Certains serveurs n'acceptent pas plus de **8KB** dans les headers
</div>
</v-click>

---

<Breadcrumbs />

**Avantages et inconvénients:**
<v-clicks>

* 👍 **Sécurité:**  Les JWT sont signés numériquement à l'aide d'un secret ou d'une paire de clés publique/privée, ce qui les protège contre toute modification par le client ou un attaquant.
* 👍 **Stockage chez le client:** Vous générez des JWT sur le serveur et les envoyez au client. Ce dernier soumet ensuite la JWT à chaque demande. Cela permet d'économiser de l'espace dans la base de données.
* 👍 **Efficace et sans état:** La vérification d'un JWT est rapide car elle ne nécessite pas de consultation de la base de données. Cela est particulièrement utile dans les grands systèmes distribués.
* 👎 **Non révocable:** En raison de leur nature autonome et du processus de vérification sans état, il peut être difficile de révoquer un JWT avant qu'il n'expire naturellement.
* 👎 **Dépendance à une clé secrète:** La création d'un JWT dépend d'une clé secrète. Si cette clé est compromise, l'attaquant peut fabriquer son propre JWT que l'API acceptera.
</v-clicks>

---

<Breadcrumbs />

### OAuth 2.0
<Hr />

* OAuth 2.0 (Open Authorization 2.0) est un protocole largement adopté et normalisé pour l'authentification et l'autorisation dans les APIs RESTfuls. 

<v-click>

<div class="flex gap-2 h-70 mt-5">
  <img src="/images/oauth-flow.png" alt="OAuth2.0 Flow : https://medium.com/@techworldwithmilan/how-does-oauth-2-0-work-bea67a760aa5" />

<div class="text-3">

* **Access token:** Les tokens d'accès sont des informations d'identification de courte durée qui représentent l'autorisation accordée au client.
* **Refresh token:**  Les tokens d'accès ont une durée de vie limitée. Pour prolonger la session de l'utilisateur sans nouvelle autorisation, le client peut utiliser un refresh token.
</div>

</div>

</v-click>

<!--
* Propriétaire de la ressource : l'entité qui possède les ressources protégées (généralement l'utilisateur).
* Client : L'application qui demande l'accès aux ressources du propriétaire de la ressource.
* Serveur d'autorisation : Le serveur est chargé d'authentifier le propriétaire de la ressource et de fournir une autorisation au client.
* Serveur de ressources : Le serveur héberge les ressources protégées auxquelles le client souhaite accéder.
-->

---

<Breadcrumbs />

Le protocole OAuth est largement utilisé dans la mise en œuvre de Single Sign-On (SSO).

<div class="flex justify-center h-3/5 mt-10">
  <img src="/images/sso.png" alt="Illustration SSO" />
</div>

---

<Breadcrumbs />

### Exercices
<Hr />

Quel type d'authentification utilise l'API de GitHub ? Référez-vous à la documentation.

<v-click>

1. Créez vous un **Classic Personal access tokens** sur GitHub: https://github.com/settings/tokens

<div class="flex justify-center h-3/5 mt-5">
  <img src="/images/github-token-setting.png" alt="Préférences du token de GitHub" />
</div>
</v-click>

<!--
1. Token-Based Authentication
-->

---

<Breadcrumbs />

2. Ajoutez ce token dans votre **Collection** Postman, dans la section **Authorization**:

<div class="flex justify-center h-3/5 mt-5">
  <img src="/images/postman-authorization.png" alt="Section Authorization d'une collection postman" />
</div>

<v-click>

3. Utilisez ce token pour créer un gist au format markdown.
</v-click>


---

<Breadcrumbs />

<br />

<v-click>

4. Éditez ce gist. Quelle réponse et status code est attendu conformément aux standards d'une API RESTful?

</v-click>

<v-click>

5. Supprimez le gist! Quelle réponse et status code est attendu conformément aux standards d'une API RESTful?
</v-click>

<!--
* 200 OK et la ressource modifié
-->
