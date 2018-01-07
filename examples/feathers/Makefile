all:
	@echo make create - create feathers app
	@echo make start - run feathers app
	@echo make bash - run bash in container

create:
	docker run --rm -it \
    -v `pwd`/src:/work/app \
		chrisgarrett/node-dev:8.9.4 \
		feathers g app

start:
	docker run --rm -it \
    -v `pwd`/src:/work/app \
		chrisgarrett/node-dev:8.9.4 \
		npm start

bash:
	docker run --rm -it \
    -v `pwd`/src:/work/app \
		chrisgarrett/node-dev:8.9.4 \
		bash

clean:
	rm -fr ./src/* ./src/.gitignore ./src/.eslintrc.json ./src/.npmignore ./src/.editorconfig
