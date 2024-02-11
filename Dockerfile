# syntax = docker/dockerfile:experimental
FROM node:20.11.0-alpine
LABEL maintainer="Chris Garrett (https://github.com/chris-garrett/docker-node-dev)"
LABEL description="Node development image based on alpine-node 20.11.0"

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
  python3 \
  libpng-dev \
  curl \
  && mkdir -p $DOWNLOADS \  
  # dockerize
  && curl -L -o $DOWNLOADS/dockerize-linux-amd64-v0.7.0.tar.gz https://github.com/jwilder/dockerize/releases/download/v0.7.0/dockerize-alpine-linux-amd64-v0.7.0.tar.gz \
  && tar -xf $DOWNLOADS/dockerize-linux-amd64-v0.7.0.tar.gz -C /usr/local/bin \
  # watchexec
  && curl -L -o $DOWNLOADS/watchexec_1.25.1.tar.xz https://github.com/watchexec/watchexec/releases/download/v1.25.1/watchexec-1.25.1-x86_64-unknown-linux-musl.tar.xz \
  && tar \
  -xf $DOWNLOADS/watchexec_1.25.1.tar.xz \
  --strip-components=1 \
  -C /usr/local/bin \
  watchexec-1.25.1-x86_64-unknown-linux-musl/watchexec \ 
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
