FROM mhart/alpine-node:6.9.1
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-node-dev)
LABEL description="Node development image based on alpine-node 6.9.1"
RUN apk --no-cache add \
  git \
  bash \
  make \
  curl \
  build-base \
  automake \
  autoconf \
  nasm \
  libpng-dev
RUN npm i cross-env
WORKDIR /app/src
EXPOSE 3000
