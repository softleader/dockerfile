# [DEPRECATED] SoftLeader ldap-server

**這個 dockerfile 已經不再建議使用, 改請改用 [hub.softleader.com.tw/apacheds](https://github.com/softleader/apacheds/wiki)**

## How to use

initial ApacheDS 的 instance 到 local 的位置

```shell
$ docker run -it --rm \
    -v "$(pwd)/apacheds-2.0.0-M24":/var/lib/apacheds-2.0.0-M24 \
    softleader/ldap-server initial
```

此時當前目錄會有一個 `apacheds-2.0.0-M24` 的檔案

## Run

**Start:**

將要使用的 partition 的資料夾 mount 到 docker 裡面 `/var/lib/apacheds-2.0.0-M24/default/partitions` 的位置

```shell
$ docker run -itd \
   -v "$(pwd)/apacheds-2.0.0-M24/default/partitions":/var/lib/apacheds-2.0.0-M24/default/partitions \
   -p 10389:10389 \
   --restart=always \
   softleader/ldap-server start
```


