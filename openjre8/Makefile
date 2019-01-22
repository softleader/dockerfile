IMAGE?=softleader/openjre8
BUILD_ENV?=IMAGE?=softleader/openjdk8

all: build push

build:
	docker build -t ${IMAGE} .
	docker build -f ./Dockerfile.font -t ${IMAGE}:font .
	docker build -f ./Dockerfile.font.build-env -t ${BUILD_ENV}:font.build-env .
	
push:
	docker push ${IMAGE}
	docker push ${IMAGE}:font
	docker push ${BUILD_ENV}:font.build-env
