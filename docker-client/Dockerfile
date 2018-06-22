FROM alpine
MAINTAINER softleader.com.tw

ENV DOCKER_VERSION "18.03.1-ce"

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk update && \ 
	apk --no-cache add \
		bash \
		vim \
		htop \
		tree \
		curl \
		procps \
		tzdata \
	&& rm -rf /var/cache/apk/* \
	&& ls /usr/share/zoneinfo \
	&& cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
	&& echo "Asia/Taipei" > /etc/timezone \
	&& curl -L -o /tmp/docker-$DOCKER_VERSION.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz \
	&& tar -xz -C /tmp -f /tmp/docker-$DOCKER_VERSION.tgz \
	&& mv /tmp/docker/docker /usr/bin \
	&& rm -rf /tmp/docker-$DOCKER_VERSION /tmp/docker

COPY .bashrc /root/.bashrc