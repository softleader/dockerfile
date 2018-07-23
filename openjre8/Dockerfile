FROM openjdk:8-jre-alpine
MAINTAINER softleader.com.tw

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk update \
    && apk --no-cache add bash vim curl procps tzdata \
    && rm -rf /var/cache/apk/* \
    && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
    && echo "Asia/Taipei" > /etc/timezone

COPY .bashrc /root/.bashrc

