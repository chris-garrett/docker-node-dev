FROM chrisgarrett/node:8.2.1
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-node-dev)
LABEL description="Node development image based on alpine-node 8.2.1"
USER root
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
  && npm i -g cross-env \
  && npm i -g feathers-cli \
  && npm i -g sequelize-cli \
  && npm i -g typescript \
  && npm i -g create-react-native-app \
  && npm cache clean --force \
  # Give node a home again.
  && sed -i -e "s/^node.*/node:x:1000:1000:Linux User,,,:\/home\/node:\/bin\/bash/" /etc/passwd \
  && mkdir -p /work/npm/bin /work/libs/ /work/app \
  && echo "prefix=/work/npm" > /home/node/.npmrc \
  && chown -R node:node /home/node /work \
  && chmod +x /entry.sh
ENV PATH /work/npm/bin:$PATH
ENV NODE_ENV=development
ENTRYPOINT ["/entry.sh"]
WORKDIR "/work/app"
EXPOSE 3000
USER node
