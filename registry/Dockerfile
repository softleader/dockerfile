FROM library/registry
MAINTAINER softleader.com.tw

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk update && \ 
	apk --no-cache add \
		bash \
		vim \
		htop \
		curl \
		procps \
		tzdata \
	&& rm -rf /var/cache/apk/* && \
	ls /usr/share/zoneinfo && \
	cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
	echo "Asia/Taipei" > /etc/timezone && \
	curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /docker-compose

COPY docker-compose.yml /docker-compose.yml
