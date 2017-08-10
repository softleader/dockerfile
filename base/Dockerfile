FROM frolvlad/alpine-oraclejdk8
MAINTAINER softleader.com.tw

RUN apk update \ 
	&& apk --no-cache add \
		bash \
		vim \
		htop \
		curl \
	&& rm -rf /var/cache/apk/*