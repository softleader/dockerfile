#! /bin/bash -eu

docker build -t softleader/registry .
docker push softleader/registry

docker tag softleader/registry hub.softleader.com.tw/registry
docker push hub.softleader.com.tw/registry
