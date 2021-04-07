# [Deprecated] SoftLeader openjdk11

請改使用 [`../azul-zulu`](../azul-zulu) 或 [`../adopt-openjdk`](../adopt-openjdk) 下的 Base Image

> 從 openjdk 11 (含)之後都轉用 [AdoptOpenJDK](https://adoptopenjdk.net/) 釋出的版本

```
$ docker pull softleader/openjdk11
```

目前 [AdoptOpenJDK on docker hub](https://hub.docker.com/u/adoptopenjdk/) 沒有純包 jre 的 image, 因此都先用 openjdk 為基底
