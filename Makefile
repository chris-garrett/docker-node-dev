export NODE_VERSION=16.13.1
export DOCKERIZE_VERSION=v0.6.1
export IMAGE_VERSION=${NODE_VERSION}
export IMAGE_NAME=chrisgarrett/node-dev

all: build

prep:
	envsubst '$${IMAGE_VERSION} $${IMAGE_NAME} $${NODE_VERSION} $${DOCKERIZE_VERSION}' \
		< ./templates/Dockerfile.template > Dockerfile
	envsubst '$${IMAGE_VERSION} $${IMAGE_NAME} $${NODE_VERSION} $${DOCKERIZE_VERSION}' \
		< ./templates/README.md.template > README.md

build: prep
	DOCKER_BUILDKIT=1 docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

sh:
	docker run --rm -it -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION} sh

push:
	docker push ${IMAGE_NAME}:${IMAGE_VERSION}
