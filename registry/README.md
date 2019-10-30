# SoftLeader Registry

## v1

```sh
# Pull from Docker Hub
$ docker run \
    -d -p 5000:5000 --restart always --name registry \
    softleader/registry

# Pull from SoftLeader Hub
$ docker run \
    -d -p 5000:5000 --restart always --name registry \
    hub.softleader.com.tw/registry
```

### Make a Release

```sh
$ make v1
```

## v2

```sh
# Pull from Docker Hub
$ docker run \
    -d -p 5000:5000 --restart always --name registry \
    softleader/registry:2

# Pull from SoftLeader Hub
$ docker run \
    -d -p 5000:5000 --restart always --name registry \
    hub.softleader.com.tw/registry:2
```

### Make a Release

```sh
$ make v2
```

