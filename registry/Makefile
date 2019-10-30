PUBLIC_IMAGE?=softleader/registry
PRIVATE_IMAGE?=hub.softleader.com.tw/registry

.PHONY: all
all: v1 v2

.PHONY: v1
v1:
	docker build -t ${PUBLIC_IMAGE} .
	docker push ${PUBLIC_IMAGE}
	docker tag ${PUBLIC_IMAGE} ${PRIVATE_IMAGE}
	docker push ${PRIVATE_IMAGE}

.PHONY: v2
v2:
	docker build -f ./Dockerfile.2 -t ${PUBLIC_IMAGE}:2 .
	docker push ${PUBLIC_IMAGE}:2
	docker tag ${PUBLIC_IMAGE}:2 ${PRIVATE_IMAGE}:2
	docker push ${PRIVATE_IMAGE}:2