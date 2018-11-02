FROM ubuntu:16.04

RUN apt-get update && apt-get install curl -y && apt-get clean && \
    curl -sL https://ibm.biz/idt-installer | bash

WORKDIR /data

ENTRYPOINT ["ibmcloud"]
