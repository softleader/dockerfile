FROM alpine
MAINTAINER softleader.com.tw

RUN apk update && \ 
	apk --no-cache add \
		openldap-clients \
		curl \
	&& rm -rf /var/cache/apk/*

ENV WORKDIR=/data \
		FILE=sample.ldif \
		BINDDN=uid=admin,ou=system \
		HOST=127.0.0.1 \
		PORT=10389 \
		PASSWD=secret

WORKDIR ${WORKDIR}

CMD ldapadd -v -h $HOST -p $PORT -c -x -D $BINDDN -w $PASSWD -f $FILE