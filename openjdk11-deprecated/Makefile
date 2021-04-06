IMAGE?=softleader/openjdk11

.PHONY: all
all: latest push

.PHONY: latest
latest:
	docker build -t ${IMAGE} .
	docker build -f ./Dockerfile.font -t ${IMAGE}:font .
	docker push ${IMAGE}
	docker push ${IMAGE}:font

.PHONY: lts
lts:
	docker build -f ./Dockerfile.lts -t ${IMAGE}:lts .
	docker build -f ./Dockerfile.lts-font -t ${IMAGE}:lts-font .
	docker push ${IMAGE}:lts
	docker push ${IMAGE}:lts-font
