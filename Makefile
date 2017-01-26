
IMAGE_VERSION=6.9.1
IMAGE_NAME=chrisgarrett/node-dev

all: build

build:
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/Dockerfile.template > Dockerfile
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/README.md.template > README.md

	docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

run:
	docker run --rm -it ${IMAGE_NAME}:${IMAGE_VERSION} bash

links:
	if [ ! -d "`pwd`/examples/links/libs/clone" ]; then \
		git clone https://github.com/pvorb/clone.git examples/links/libs/clone; \
	fi
	docker run --rm -it \
		-v `pwd`/examples/links/app:/app/src \
		-v `pwd`/examples/links/libs:/app/links/libs \
		${IMAGE_NAME}:${IMAGE_VERSION} bash
