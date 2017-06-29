
IMAGE_VERSION=8.1.2
IMAGE_NAME=chrisgarrett/node-dev

all: build

prep:
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/Dockerfile.template > Dockerfile
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/README.md.template > README.md
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/docker-compose.yml.template > docker-compose.yml

build: prep
	docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

run:
	docker run --rm -it \
		-v `pwd`/examples/links/app:/work/app \
		-v `pwd`/examples/links/libs/mylib1:/work/libs/mylib1 \
		${IMAGE_NAME}:${IMAGE_VERSION} \
		bash

up: down
	docker-compose -p links up

down:
	docker-compose -p links rm -f

restart:
	docker-compose -p links restart links_app
