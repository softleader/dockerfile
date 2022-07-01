it gFROM docker:dind
MAINTAINER softleader.com.tw

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk update && \
	apk --no-cache add make curl jq &&\
	rm -rf /var/cache/apk/*
