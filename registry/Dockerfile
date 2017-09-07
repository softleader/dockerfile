FROM library/registry
MAINTAINER softleader.com.tw

# install packages
RUN apk update && \ 
	apk --no-cache add \
		bash \
		vim \
		htop \
		curl \
		procps \
		tzdata \
	&& rm -rf /var/cache/apk/* && \

	# set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
	ls /usr/share/zoneinfo && \
	cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
	echo "Asia/Taipei" > /etc/timezone