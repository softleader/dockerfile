IMAGE?=softleader/openjre8
BUILD_ENV?=softleader/openjdk8

all: build push

build:
	docker build -t ${IMAGE} .
	docker build -f ./Dockerfile.font -t ${IMAGE}:font .
	docker build -f ./Dockerfile.font.build-env -t ${BUILD_ENV}:font.build-env .
	docker build -f ./Dockerfile.lts -t ${IMAGE}:lts .
	docker build -f ./Dockerfile.lts-font -t ${IMAGE}:lts-font .

push:
	docker push ${IMAGE}
	docker push ${IMAGE}:font
	docker push ${BUILD_ENV}:font.build-env
	docker push ${IMAGE}:lts
	docker push ${IMAGE}:lts-font
