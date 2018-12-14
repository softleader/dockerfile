IMAGE?=softleader/openjdk11

all: build push build-font push-font

build:
	docker build -t ${IMAGE} .

push:
	docker push ${IMAGE}

build-font:
	docker build -f ./Dockerfile.font -t ${IMAGE}:font .

push-font:
	docker push ${IMAGE}:font
