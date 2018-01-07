all:
	@echo make create - create react native app
	@echo make start - run react native app
	@echo make bash - run bash in container

create:
	docker run --rm -it \
		-v `pwd`/:/work/app \
		chrisgarrett/node-dev:8.9.4 \
		bash -c "yarn add create-react-native-app && npx create-react-native-app AwesomeProject && mv AwesomeProject src"

start:
	docker run --rm -it \
		-p 19000:19000 \
		-v `pwd`/src:/work/app \
		-e REACT_NATIVE_PACKAGER_HOSTNAME=EXTERNAL_HOSTNAME \
		chrisgarrett/node-dev:8.9.4 \
		npm start

bash:
	docker run --rm -it \
		-v `pwd`/src:/work/app \
		chrisgarrett/node-dev:8.9.4 \
		bash

clean:
	rm -fr ./src/*
