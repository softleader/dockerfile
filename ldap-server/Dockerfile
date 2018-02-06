FROM ubuntu:16.04
MAINTAINER softleader.com.tw

RUN apt-get update && apt-get install -y \
    vim \
    default-jre \
    netcat \
    telnet \
    curl \
 && rm -rf /var/lib/apt/lists/*

RUN curl -O http://ftp.twaren.net/Unix/Web/apache//directory/apacheds/dist/2.0.0-M24/apacheds-2.0.0-M24-amd64.deb \
	&& chmod +x apacheds-2.0.0-M24-amd64.deb \
	&& dpkg -i apacheds-2.0.0-M24-amd64.deb 

RUN mkdir /tmp && cp -r /var/lib/apacheds-2.0.0-M24 /

COPY installer /installer.sh

RUN chmod 777 /installer.sh


ENTRYPOINT ["/bin/bash", "/installer.sh"]
