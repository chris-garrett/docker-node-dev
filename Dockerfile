FROM chrisgarrett/node:6.9.1
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-node-dev)
LABEL description="Node development image based on alpine-node 6.9.1"
USER root
RUN apk --no-cache add --update \
  git \
  make \
  build-base \
  automake \
  autoconf \
  nasm \
  python \
  libpng-dev \
  && npm i -g cross-env \
  && npm i -g feathers-cli \
  && npm i -g sequelize-cli \
  && npm cache clean \
  && echo "prefix=/app/npm" > /home/node/.npmrc \
  && mkdir -p /app/npm/bin \
  && mkdir -p /app/libs \
  && chown -R node /app
ENV PATH /app/npm/bin:$PATH
WORKDIR /app/src
EXPOSE 3000
USER node
