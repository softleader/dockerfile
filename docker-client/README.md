# SoftLeader Docker Client

Control host docker in docker

```
$ docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	softleader/docker-client bash
```