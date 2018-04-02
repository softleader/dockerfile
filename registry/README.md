# SoftLeader Registry

SoftLeader registry

```
$ docker run -d -p 5000:5000 --restart always --name registry softleader/registry
```

# Make a Release

```
$ docker build -t softleader/registry .
$ docker push softleader/registry # 標準的 image name

$ docker tag softleader/registry hub.softleader.com.tw/registry
$ docker push hub.softleader.com.tw/registry # for 只有開通松凌網路的客戶使用
```
