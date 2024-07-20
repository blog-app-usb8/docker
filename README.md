# Blog app (DevOps)
- A website that helps users share interesting blogs. Besides, other users could also interact with these blogs by commenting or using likes
- Tech: Docker, nginx

# Directory structure
```
blog-app
  ├── frontend
  |     ├── dev.Dockerfile
  |     └── Dockerfile (.dockerignore)
  ├── backend
  |     ├── mongo
  |     ├── dev.Dockerfile
  |     └── Dockerfile (.dockerignore)
  ├── nginx.dev.conf
  ├── nginx.conf
  ├── docker-compose.dev.yml
  └── docker-compose.yml
```

# Docker commands:

## Build images and start containers
```shell
$ docker-compose -f docker-compose.dev.yml up # Frontend on port 3000, Backend on port 3001/api/
$ docker-compose up # Frontend on port 8080, Backend on port 8080/api/api
```

## Build images and start containers
```shell
$ docker-compose -f docker-compose.dev.yml down --volumes
$ docker-compose down
```

# Note
- `docker-compose.yml` worked well
- `docker-compose.dev.yml` have a small issue in backend container:
  - Error loading shared library /usr/src/app/node_modules/bcrypt/lib/binding/napi-v3/bcrypt_lib.node: Exec format error
  - Solution:
    - In backend - host: run `npm uninstall bcrypt`, then run `docker-compose.dev.yml`
    - In backend - container: run `npm i bcrypt`
  - [Ref 1](https://github.com/kelektiv/node.bcrypt.js/issues/824), [Ref 2](https://github.com/compdemocracy/polis/issues/1391)