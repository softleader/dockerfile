# SoftLeader Azul openjdk

```sh
# Java 8
$ docker pull harbor.softleader.com.tw/thirdparty/zulu-openjdk-alpine:8-jre-taipei
$ docker pull harbor.softleader.com.tw/thirdparty/zulu-openjdk-alpine:8-font-jre-taipei

# Java 11
$ docker pull harbor.softleader.com.tw/thirdparty/zulu-openjdk-alpine:11-jre-taipei
$ docker pull harbor.softleader.com.tw/thirdparty/zulu-openjdk-alpine:11-font-jre-taipei
```

> font 版本的內含了 [DejaVu](https://dejavu-fonts.github.io/) 字型, image 大約會比無 font 版本的多 10mb, 通常會用在 pdf 匯出指定字型的需求上
