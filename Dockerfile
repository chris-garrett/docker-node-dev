# syntax = docker/dockerfile:experimental
FROM node:14.17.0-alpine
LABEL maintainer="Chris Garrett (https://github.com/chris-garrett/docker-node-dev)"
LABEL description="Node development image based on alpine-node 14.17.0"

ARG DOWNLOADS=/root/downloads

USER root

ENV ENV=/home/node/.profile
ENV NODE_ENV=development

RUN apk --no-cache add -U \
  git \
  make \
  build-base \
  automake \
  autoconf \
  nasm \
  python \
  libpng-dev \
  curl \
  && mkdir -p $DOWNLOADS \  
  && curl -L -o $DOWNLOADS/dockerize-alpine-linux-amd64-v0.6.1.tar.gz https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-alpine-linux-amd64-v0.6.1.tar.gz \
  && tar -xf $DOWNLOADS/dockerize-alpine-linux-amd64-v0.6.1.tar.gz -C /usr/local/bin \
  && rm -fr $DOWNLOADS \  
  && npm cache clean --force \
  && echo "alias l='ls -laFHh'" >> /home/node/.profile \
  && echo "set tabstop=4\nset shiftwidth=4\nset expandtab\nset nowrap\nset nobackup\nset nu" > /home/node/.vimrc \
  && mkdir -p /work/app \
  && chown -R node:node /work \
  && rm -rf /var/cache/apk/*

USER node

WORKDIR "/work/app"
EXPOSE 3000
