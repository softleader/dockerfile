FROM golang:alpine
MAINTAINER softleader.com.tw

RUN apk update && \ 
	apk --no-cache add \
		bash \
		vim \
		tree \
		curl \
		git \
		procps \
		tzdata \
	&& rm -rf /var/cache/apk/* && \
	ls /usr/share/zoneinfo && \
	cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
	echo "Asia/Taipei" > /etc/timezone && \
	go get github.com/goreleaser/goreleaser

VOLUME ~/.config/goreleaser/

COPY github_token /root/.config/goreleaser/github_token