FROM alpine:latest
MAINTAINER softleader.com.tw

RUN apk update \
    && apk --no-cache add curl jq tini \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
CMD ["curl"]
