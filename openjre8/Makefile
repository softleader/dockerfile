IMAGE?=softleader/openjre8
BUILD_ENV?=softleader/openjdk8

.PHONY: all
all: latest build push

.PHONY: latest
latest:
	docker build -t ${IMAGE} .
	docker build -f ./Dockerfile.font -t ${IMAGE}:font .
	docker push ${IMAGE}
	docker push ${IMAGE}:font

.PHONY: build-env
build-env:
	docker build -f ./Dockerfile.font.build-env -t ${BUILD_ENV}:font.build-env .
	docker push ${BUILD_ENV}:font.build-env

.PHONY: lts
lts:
	docker push ${IMAGE}:lts
	docker push ${IMAGE}:lts-font
	docker build -f ./Dockerfile.lts -t ${IMAGE}:lts .
	docker build -f ./Dockerfile.lts-font -t ${IMAGE}:lts-font .
