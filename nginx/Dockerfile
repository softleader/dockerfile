FROM harbor.softleader.com.tw/library/nginx-unprivileged:stable-alpine-1.28.3

USER root

RUN apk update && apk --no-cache upgrade

USER $UID
