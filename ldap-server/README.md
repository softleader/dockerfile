# SoftLeader ldap-server

>  Quick start Ldap Server (ApacheDS)

## How to use

initial ApacheDS 的 instance 到 local 的位置

```shell
$ docker run -it --rm -v "$(pwd)/apacheds-2.0.0-M24":/var/lib/apacheds-2.0.0-M24 --name apacheds softleader/ldap-server initial
```

此時當前目錄會有一個 `apacheds-2.0.0-M24` 的檔案

## Run

**Start:**

將要使用的 partition 的資料夾 mount 到 docker 裡面 `/var/lib/apacheds-2.0.0-M24/default/partitions/...` 的位置

ex: 將 `example` 這個 partition (也就是 dc=example,dc=com) mount 到 docker 裡

```shell
docker run -it --rm -v "$(pwd)/apacheds-2.0.0-M24/default/partitions/example":/var/lib/apacheds-2.0.0-M24/default/partitions/example -p 10389:10389 --name apacheds softleader/ldap-server start
```

> Note: 若將整個 partitions mount 到 docker 裡，可能會有 ldap server 無法開啟的問題
