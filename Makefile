
VERSION=6.9.1
IMAGE_NAME=chrisgarrett/node-dev

build:
	VERSION=${VERSION} envsubst < ./templates/Dockerfile.template > Dockerfile
	VERSION=${VERSION} envsubst < ./templates/README.md.template > README.md

	docker build --rm=true -t ${IMAGE_NAME}:${VERSION} .

run:
	docker run --rm -it ${IMAGE_NAME}:${VERSION}
