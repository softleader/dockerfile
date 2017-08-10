#!/bin/sh
docker login -u $1 -p $2
docker stop %3
docker rm %3
docker rmi %3
docker build -t $3 .
docker run -itd --name $3 --net softleader $4 $3