FROM nginxinc/nginx-unprivileged:stable-alpine

USER root

RUN apk update && apk --no-cache upgrade

USER $UID