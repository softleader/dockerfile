# SoftLeader openjre8

## JRE Runtime

- *softleader/openjre8* - OpenJDK8 base image with root user, useful for developer testing environments.
- *softleader/openjre8:font* - OpenJDK 8 base runtime image w/ root user and fonts

---

- *softleader/openjre8:lts* - Long Term Supports OpenJDK 8 image.
- *softleader/openjre8:lts-font* - Long Term Supports OpenJDK 8 image for softleader/openjre8:font 

### LTS

LTS image 會被 SoftLeader 長期維護, 並以符合各家客戶 Production 考量來調整 Image 內容, LTS 使用以下權限執行 container, 如果有 mount host volume, 請確保 host volume 使用相同的 uid:

- user - softleader
- uid - 1000
- group - softleader
- gid - 1000

啟動 container 時以下目錄均已事先 grant 好權限給 softleader group, 請將 app 的任何 file systems 寫出都放置在以下目錄中:

- */var/softleader_home* - home directory for softleader user. (`$SL_HOME`)
- */var/softleader_home/dumps* - where the directory keeps heap dump files. (`$SL_DUMPS`)
- */tmp* - where a Spring Boot application creates working directory for Tomcat by default.

#### Example Dockerfile for SoftLeader App

```
FROM softleader/openjre8:lts

VOLUME $SL_HOME/exchange/export

ENV HEAP_DUMP_FILE=""
ENV HEAP_DUMP="-XX:+ExitOnOutOfMemoryError -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$SL_DUMPS"
ENV SPRING_PROFILES_ACTIVE=docker,sit,schedule
ENV JAVA_OPTS="-Dsoftleader.boot.failFast=true -Xmx512m -Xmx512m -Dspring.profiles.active=$SPRING_PROFILES_ACTIVE"
ENV ENTROPY_SOURCE=-Djava.security.egd=file:/dev/./urandom
ENV DEVOPS_OPTS=""

COPY target/app.jar $SL_HOME/app.jar

ENTRYPOINT [ "sh", "-c", "java $HEAP_DUMP$HEAP_DUMP_FILE $JAVA_OPTS $DEVOPS_OPTS $ENTROPY_SOURCE $SL_HOME/app.jar" ]
```

in your *application.properties*:

```properties
exchange.export.path=${SL_HOME:/}exchange/export
```

## Build Env 

- *softleader/openjdk8:font.build-env* - Build env for openjre8:font 
