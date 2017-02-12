# docker-node-dev

* Node development image based on alpine-node 6.9.1

## Versions
- alpine-node 6.9.1

## Usage

```docker run --rm -v `pwd`/src:/app/src chrisgarrett/node-dev npm run start```

When your wanting to work on libraries as well as your app:

A single lib folder that contains one project:
```
docker run --rm \
  -v `pwd`/src:/app/src \
  -v `pwd`/../mylib:/app/links/libs/mylib \
  chrisgarrett/node-dev npm run start
```

A libs folder that contains several projects:
```
docker run --rm \
  -v `pwd`/src:/app/src \
  -v `pwd`/../libs:/app/links/libs \
  chrisgarrett/node-dev npm run start
```
Then in your `package.json` you can add the script steps to install and consume the links

```
"scripts": {
  "lib-link": "cd /app/links/libs/mylib && npm link",
  "app-link": "cd /app/src && npm link mylib",
  "app-install": "cd /app/src && npm install",
  "app-start": "cd /app/src && babel-watch ./src/index.js -w ./src",
  "start": "npm run lib-link && npm run app-link && npm run app-install && npm run app-start",
},
```

## Credits
