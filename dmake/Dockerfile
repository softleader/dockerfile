FROM docker
MAINTAINER softleader.com.tw

RUN apk update \
		&& apk --no-cache add make \
		&& rm -rf /var/cache/apk/*

WORKDIR /data

ENTRYPOINT [ "make" ]