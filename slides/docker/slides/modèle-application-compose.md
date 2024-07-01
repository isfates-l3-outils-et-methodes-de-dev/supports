
<Breadcrumbs />

### Modèle d'application Compose
<Hr />

<div class="grid grid-cols-2 gap-4">

```yaml {*}{lines:true}
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
```

<div>

```yaml {*}{lines:true,startLine:18}
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

secrets:
  server-certificate:
    external: true

networks:
  front-tier: {}
  back-tier: {}
```

[<mdi-book-open /> Documentation officielle](https://docs.docker.com/compose/compose-file/)
</div>
</div>

---

<Breadcrumbs />

#### Services
<Hr />

<div class="grid grid-cols-2 gap-4 ">

```yaml {1-19}{lines:true}
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
```

<div>

```yaml {0,0}{lines:true,startLine:18}
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

secrets:
  server-certificate:
    external: true

networks:
  front-tier: {}
  back-tier: {}
```

Un **service** est un concept abstrait mis en œuvre sur des plateformes en exécutant une ou plusieurs fois la même image de conteneur et la même configuration.
</div>
</div>

---

<Breadcrumbs />

#### Networks
<Hr />

<div class="grid grid-cols-2 gap-4 ">

```yaml {6-8,16-17}{lines:true}
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
```

<div>

```yaml {28-30}{lines:true,startLine:18}
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

secrets:
  server-certificate:
    external: true

networks:
  front-tier: {}
  back-tier: {}
```

<p class="text-sm">

Les services communiquent entre eux par l'intermédiaire de **networks**. Dans la spécification Compose, un network est une abstraction de capacité de plateforme permettant d'établir une route IP entre des conteneurs au sein de services connectés entre eux.
</p>
</div>
</div>

---

<Breadcrumbs />

#### Volumes
<Hr />

<div class="grid grid-cols-2 gap-4 ">

```yaml {14-15}{lines:true}
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
```

<div>

```yaml {18-22}{lines:true,startLine:18}
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

secrets:
  server-certificate:
    external: true

networks:
  front-tier: {}
  back-tier: {}
```

Les services stockent et partagent des données persistantes dans des **volumes**.
</div>
</div>


---

<Breadcrumbs />

#### Secrets
<Hr />

<div class="grid grid-cols-2 gap-4 ">

```yaml {9-10}{lines:true}
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
```

<div>

```yaml {24-26}{lines:true,startLine:18}
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

secrets:
  server-certificate:
    external: true

networks:
  front-tier: {}
  back-tier: {}
```

<p class="text-sm">

Un **secret** est une forme spécifique de données de configuration pour les données sensibles qui ne doivent pas être exposées sans considérations de sécurité. Les secrets sont mis à la disposition des services sous forme de fichiers montés dans leurs conteneurs.
</p>

</div>
</div>


---

<Breadcrumbs />

#### Version
<Hr />

<br />

La propriété `version` est définie par la spécification Compose à des fins de rétrocompatibilité mais est **obsolète**.

```yaml
version: '3.8'

services:
  ...
```

Ce format fusionne les formats de versions `2.x` et `3.x` du modèle Compose qui ne sont plus activement maintenus.
