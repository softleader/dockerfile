FROM nginxinc/nginx-unprivileged:alpine3.23-perl

USER root

RUN apk update && apk --no-cache upgrade

USER $UID
