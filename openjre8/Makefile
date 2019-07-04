# JRE for runtime use
JRE?=softleader/openjre8
# JDK for build use
JDK?=softleader/openjdk8

.PHONY: all
all: latest build-env lts grpc

.PHONY: latest
latest:
	docker build -t ${JRE} .
	docker build -f ./Dockerfile.font -t ${JRE}:font .
	docker push ${JRE}
	docker push ${JRE}:font

.PHONY: build-env
build-env:
	docker build -f ./Dockerfile.font.build-env -t ${JDK}:font.build-env .
	docker push ${JDK}:font.build-env

.PHONY: lts
lts:
	docker build -f ./Dockerfile.lts -t ${JRE}:lts .
	docker build -f ./Dockerfile.lts-font -t ${JRE}:lts-font .
	docker push ${JRE}:lts
	docker push ${JRE}:lts-font

.PHONY: grpc
grpc:
	docker build -f ./Dockerfile.grpc -t ${JDK}:grpc .
	docker push ${JDK}:grpc
