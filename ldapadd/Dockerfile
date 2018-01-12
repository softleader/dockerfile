FROM alpine
MAINTAINER softleader.com.tw

RUN apk update && \ 
	apk --no-cache add \
		openldap-clients \
		curl \
	&& rm -rf /var/cache/apk/*

COPY installer /installer.sh
COPY sample.ldif /tmp

ENV WORKDIR=/data \
		FILE=sample.ldif \
		BINDDN=uid=admin,ou=system \
		HOST=127.0.0.1 \
		PORT=10389 \
		PASSWD=secret \
		NEWPASSWD=secret

WORKDIR ${WORKDIR}

RUN chmod 777 /installer.sh

ENTRYPOINT ["/bin/sh", "/installer.sh"]





