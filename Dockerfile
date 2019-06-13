FROM chrisgarrett/node:12.4.0
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-node-dev)
LABEL description="Node development image based on alpine-node 12.4.0"

USER root

ENV PATH /work/npm/bin:$PATH
ENV NODE_ENV=development
ADD scripts/entry.sh /entry.sh

RUN apk --no-cache add --update \
  git \
  make \
  build-base \
  automake \
  autoconf \
  nasm \
  python \
  libpng-dev \
  && npm i -g npx \ 
  && npm i -g yarn \ 
  && npm cache clean --force \
  && sed -i -e "s/^node.*/node:x:1000:1000:Linux User,,,:\/home\/node:\/bin\/bash/" /etc/passwd \
  && mkdir -p /work/npm/bin /work/libs/ /work/app \
  && echo "prefix=/work/npm" > /home/node/.npmrc \
  && chown -R node:node /home/node /work \
  && chmod +x /entry.sh

USER node

ENTRYPOINT ["/entry.sh"]
WORKDIR "/work/app"
EXPOSE 3000
