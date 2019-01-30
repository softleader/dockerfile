# SoftLeader openjre8

## JRE Runtime

- *softleader/openjre8* - OpenJDK8 base image with root user, useful for developer testing environments.
- *softleader/openjre8:font* - OpenJDK 8 base runtime image w/ root user and fonts

---

- *softleader/openjre8:lts* - Long Term Supports OpenJDK 8 image.
- *softleader/openjre8:lts-font* - Long Term Supports OpenJDK 8 image for softleader/openjre8:font 

### LTS

LTS image 會被 SoftLeader 長期維護, 會持續以符合各家客戶 Production 考量來調整 Image 內容, LTS 使用以下權限執行 container

- user - softleader
- uid - 1000
- group - softleader
- gid - 1000

上述變數都可以在 container 啟動時加以調整, 只要在你想要調整的變數前面加上底線即可:

```sh
# 例如你想要調整 user 成 hello, uid 成 1001:
$ docker run -it -e '_uid=1001' -e '_user=hello' softleader/openjre8:lts id
uid=1001(hello) gid=1000(softleader) groups=1000(softleader),1000(softleader)
```

每次在啟動 container 時, image 中的 `/entrypoint.sh` 會將以下目錄 grant 好權限, 因此請將程式中任何的 file system 讀取/寫出都放置在以下目錄中:

- */var/softleader_home* - home directory for softleader user. (`$SL_HOME`)
- */var/softleader_home/dumps* - where the directory keeps heap dump files. (`$SL_DUMPS`)
- */var/softleader_home/logs* - where the Spring Boot application logfile stores. (`$SL_LOGS`)
- */tmp* - where a Spring Boot application creates working directory for Tomcat by default.

> 如果有 mount host volume 到 container 不在以上所列出的目錄內的, 請確保 host volume 使用相同的 uid

#### Example Dockerfile of SoftLeader App

```
FROM softleader/openjre8:lts

VOLUME $SL_HOME/some/path/for/my/app

ENV HEAP_DUMP_FILE=""
ENV HEAP_DUMP="-XX:+ExitOnOutOfMemoryError -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$SL_DUMPS"
ENV SPRING_PROFILES_ACTIVE=docker,sit,schedule
ENV JAVA_OPTS="-Dsoftleader.boot.failFast=true -Xmx512m -Xmx512m -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE"
ENV ENTROPY_SOURCE=-Djava.security.egd=file:/dev/./urandom
ENV DEVOPS_OPTS=""

COPY target/app.jar $SL_HOME/app.jar

CMD ["java", "$HEAP_DUMP$HEAP_DUMP_FILE", "$JAVA_OPTS", "$DEVOPS_OPTS", "$ENTROPY_SOURCE", "-jar", "$SL_HOME/app.jar"]
```

in your *application.properties*:

```properties
some.path.for.my.app=${SL_HOME}/some/path/for/my/app
```

### Migrate from ROOT user base image to LTS image

Click [Wiki: Migrate from ROOT user base image to LTS image](https://github.com/softleader/softleader-microservice-wiki/wiki/Migrate-from-ROOT-user-base-image-to-LTS-image) to see more details.

## Build Env 

- *softleader/openjdk8:font.build-env* - Build env for openjre8:font 
