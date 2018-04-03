# SoftLeader Registry

SoftLeader registry

```
# 標準的 image name
$ docker run -d -p 5000:5000 --restart always --name registry softleader/registry

# for 只有開通松凌網路的客戶使用
$ docker run -d -p 5000:5000 --restart always --name registry hub.softleader.com.tw/registry
```

## Make a Release

```
$ sh ./release.sh
```


## Start Registry using a Compose file on 192.168.1.88

```yaml
# /registry/docker-compose.yml on 192.168.1.88

registry:
  image: softleader/registry
  ports:
    - 127.0.0.1:5000:5000
  volumes:
    - /repositories:/var/lib/registry
```

Start your registry by issuing the following command in the directory containing the `docker-compose.yml` file:

```
$ docker-compose up -d
```
