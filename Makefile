
IMAGE_VERSION=12.4.0
IMAGE_NAME=chrisgarrett/node-dev

all: build

prep:
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/Dockerfile.template > Dockerfile
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/README.md.template > README.md
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/docker-compose.yml.template > docker-compose.yml
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/examples/feathers/Makefile > examples/feathers/Makefile
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/examples/reactnative/Makefile > examples/reactnative/Makefile

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
