FROM adoptopenjdk/openjdk11:alpine-slim
MAINTAINER softleader.com.tw

# install packages & set timezone: https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk update \
    && apk --no-cache add bash vim curl tzdata \
    && rm -rf /var/cache/apk/* \
    && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
    && echo "Asia/Taipei" > /etc/timezone \
    && apk del tzdata

ENV TZ=Asia/Taipei

COPY .bashrc /root/.bashrc

VOLUME /logs
