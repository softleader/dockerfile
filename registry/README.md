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
