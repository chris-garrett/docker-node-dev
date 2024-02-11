# docker-node-dev

Node development image 20.11.0

## Versions / packages
* Node 20.11.0: https://nodejs.org/en/
- Dockerize v0.7.0: https://github.com/jwilder/dockerize

## Usage

### Standalone app:

Assumes that `app` is the directory that contains your package.json.
```
docker run --rm \
      -v `pwd`/examples/links/app:/work/app \
      chrisgarrett/node-dev:20.11.0 \
      npm start
```
