FROM softleader/alpine
MAINTAINER softleader.com.tw

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN echo "http://dl-3.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
	&& apk update --update-cache && \
	apk --no-cache add \
		ansible \
		openssh \
		openssl \
		sshpass \
    && rm -rf /var/cache/apk/*
