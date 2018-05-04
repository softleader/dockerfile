FROM softleader/alpine
MAINTAINER softleader.com.tw

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk update && \
	apk --no-cache add \
		ansible \
		python \
		openssh \
		openssl \
		sshpass \
    && rm -rf /var/cache/apk/*
