# docker-node-dev

Node development image 14.17.0

## Versions / packages
* Node 14.17.0: https://nodejs.org/en/
- Dockerize v0.6.1: https://github.com/jwilder/dockerize

## Usage

### Standalone app:

Assumes that `app` is the directory that contains your package.json.
```
docker run --rm \
      -v `pwd`/examples/links/app:/work/app \
      chrisgarrett/node-dev:14.17.0 \
      npm start
```
