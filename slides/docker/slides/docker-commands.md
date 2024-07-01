<Breadcrumbs />

### CLI de Docker: les bases

<Hr />

<table class="text-xs -mt-3">
  <thead>
    <tr>
      <th>Commande</th>
      <th>Description</th>
      <th>Aliase</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>docker image ls</code></td>
      <td>Liste toutes les images</td>
      <td><code>docker images</code></td>
    </tr>
    <tr>
      <td><code>docker image rm &lt;image&gt;</code></td>
      <td>Supprime une image</td>
      <td><code>docker rmi</code></td>
    </tr>
    <tr>
      <td><code>docker image pull &lt;image&gt;</code></td>
      <td>Pull une image à partir d'un <i>docker registry</i></td>
      <td><code>docker pull</code></td>
    </tr>
    <tr>
      <td><code>docker container ls -a</code></td>
      <td>Liste tous les conteneurs</td>
      <td><code>docker ps -a</code></td>
    </tr>
    <tr>
      <td><code>docker container run &lt;image&gt;</code></td>
      <td>Exécute un conteneur à partir d'une image</td>
      <td><code>docker run</code></td>
    </tr>
    <tr>
      <td><code>docker container rm &lt;container&gt;</code></td>
      <td>Supprime un conteneur</td>
      <td><code>docker rm</code></td>
    </tr>
    <tr>
      <td><code>docker container stop &lt;container&gt;</code></td>
      <td>Stop un conteneur</td>
      <td><code>docker stop</code></td>
    </tr>
    <tr>
      <td><code>docker container exec &lt;container&gt;</code></td>
      <td>Exécute une commande à l'intérieur du conteneur</td>
      <td><code>docker exec</code></td>
    </tr>
  </tbody>
</table>

<p class="text-right text-xs !-mt-2">

[Docker CLI documentation](https://docs.docker.com/reference/cli/docker/)
</p>