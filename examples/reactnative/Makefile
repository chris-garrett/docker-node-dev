all:
	@echo make create - create react native app
	@echo make start - run react native app
	@echo make bash - run bash in container

create:
	docker run --rm -it \
        -v `pwd`:/work \
        -w /work \
        chrisgarrett/node-dev:8.2.1 \
        create-react-native-app AwesomeProject \
        && mv AwesomeProject src

start:
	docker run --rm -it \
		-p 19000:19000 \
		-v `pwd`/src:/work/app \
		-e REACT_NATIVE_PACKAGER_HOSTNAME=wolfswood.mackaylaw.ca \
		chrisgarrett/node-dev:8.2.1 \
		npm start

bash:
	docker run --rm -it \
    -v `pwd`/src:/work/app \
		chrisgarrett/node-dev:8.2.1 \
		bash

clean:
	rm -fr ./src/*
