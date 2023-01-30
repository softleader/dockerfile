# SoftLeader Docker

Control host docker in docker

```
$ docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	harbor.softleader.com.tw/library/docker:dind --version
```
