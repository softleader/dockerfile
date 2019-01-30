FROM frolvlad/alpine-oraclejdk8
MAINTAINER softleader.com.tw

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk update && \ 
	apk --no-cache add \
		bash \
		vim \
		tree \
		curl \
		procps \
		tzdata \
	&& rm -rf /var/cache/apk/* && \
	ls /usr/share/zoneinfo && \
	cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
	echo "Asia/Taipei" > /etc/timezone

COPY .bashrc /root/.bashrc

VOLUME /logs
