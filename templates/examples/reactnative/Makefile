all:
	@echo make create - create react native app
	@echo make start - run react native app
	@echo make bash - run bash in container

create:
	docker run --rm -it \
		-v `pwd`/:/work/app \
		${IMAGE_NAME}:${IMAGE_VERSION} \
		bash -c "yarn add create-react-native-app && npx create-react-native-app AwesomeProject && mv AwesomeProject src"

start:
	docker run --rm -it \
		-p 19000:19000 \
		-v `pwd`/src:/work/app \
		-e REACT_NATIVE_PACKAGER_HOSTNAME=EXTERNAL_HOSTNAME \
		${IMAGE_NAME}:${IMAGE_VERSION} \
		npm start

bash:
	docker run --rm -it \
		-v `pwd`/src:/work/app \
		${IMAGE_NAME}:${IMAGE_VERSION} \
		bash

clean:
	rm -fr ./src/*
