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

```
registry:
  restart: always
  image: softleader/registry
  ports:
    - 5000:5000
  environment:
    REGISTRY_HTTP_TLS_CERTIFICATE: /certs/domain.crt
    REGISTRY_HTTP_TLS_KEY: /certs/domain.key
    REGISTRY_AUTH: htpasswd
    REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
    REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
  volumes:
    - /repositories:/var/lib/registry
    - /registry/certs:/certs
    - /registry/auth:/auth
```
