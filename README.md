# DESCRIPTION
A website that helps users share interesting blogs. Besides that, other users also could interact with these blogs by commenting or using like.

## Full Stack open CI/CD
This repository is used for Docker

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

## SCRIPT:
build images and start containers:
  `docker-compose -f docker-compose.dev.yml up`
  `docker-compose up`
stop:
  `docker-compose -f docker-compose.dev.yml down --volumes`
  `docker-compose down`

## IN LOCAL HOST
It is opened at port 8080 for front-end
It is opened at port 8080/api/api for back-end

It is opened at port 3000 for front-end
It is opened at port 3001/api for back-end

## NOTE:
docker-compose.yml worked well
docker-compose.dev.yml have a small issue in backend container:
  - Error loading shared library /usr/src/app/node_modules/bcrypt/lib/binding/napi-v3/bcrypt_lib.node: Exec format error
  - --> Solution:
    In backend - host: run `npm uninstall bcrypt`, then run `docker-compose.dev.yml`
    In backend - container: run `npm i bcrypt`
    https://github.com/kelektiv/node.bcrypt.js/issues/824
    https://github.com/compdemocracy/polis/issues/1391
