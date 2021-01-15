FROM alpine:3.13
LABEL maintainer="softleader.com.tw"

ARG GITHUB_CLI_VERSION=1.4.0

RUN apk --no-cache add curl git &&\
    curl -L https://github.com/cli/cli/releases/download/v${GITHUB_CLI_VERSION}/gh_${GITHUB_CLI_VERSION}_linux_amd64.tar.gz -o /tmp/gh.tar.gz &&\
    tar zxvf /tmp/gh.tar.gz -C /tmp &&\
    mv /tmp/gh_${GITHUB_CLI_VERSION}_linux_amd64/bin/gh /usr/local/bin