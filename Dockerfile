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
  libpng-dev
RUN npm i -g cross-env && npm cache clean
WORKDIR /app/src
EXPOSE 3000
USER sprout
