# SoftLeader tomcat image

> 依賴了 [softleader/base](https://github.com/softleader/dockerfile/tree/master/base)

## Installed

- Tomcat 8.5

## ENV

依賴此 image 即有以下環境變數可以使用:

- `TOMCAT_MAJOR`
- `TOMCAT_VERSION`
- `TOMCAT_HOME`
- `CATALINA_HOME`
- `CATALINA_OUT`

## Usage

You can build tomcat image from source code

```
$ docker build -t softleader/tomcat .
```

or pull from docker hud

```
$ docker pull softleader/tomcat
```

Write *my-tomcat* Dockerfile:

```
FROM softleader/tomcat85

# "/tmp" is where a Spring Boot application creates working directories for Tomcat by default.
VOLUME /tmp

RUN echo '#! /bin/sh' > ${TOMCAT_HOME}/bin/setenv.sh
RUN echo 'export JAVA_OPTS="-Xmx1536m -Xmx1536m' >> ${TOMCAT_HOME}/bin/setenv.sh

COPY target/app.war ${TOMCAT_HOME}/webapps/ROOT.war

CMD ${TOMCAT_HOME}/bin/catalina.sh run
```

run:

```
$ docker run -itd -p 80:8080 my-tomcat
```

在 run 的時候如果把自己的 `server.xml` mount 進去, 則可以覆蓋預設的版本

```
$ docker run -itd -p 80:8080 \
    -v /path/to/server.xml:/opt/tomcat/conf/server.xml \
    my-tomcat
```

## SSL

You can build SSL tomcat image from source code

```
$ docker build -t softleader/tomcat:ssl -f Dockerfile.ssl .
```

or pull from docker hud

```
$ docker pull softleader/tomcat:ssl
```

Write *my-ssl-tomcat* Dockerfile

```
FROM softleader/tomcat85:ssl

# "/tmp" is where a Spring Boot application creates working directories for Tomcat by default.
VOLUME /tmp

RUN echo '#! /bin/sh' > ${TOMCAT_HOME}/bin/setenv.sh
RUN echo 'export JAVA_OPTS="-Xmx1536m -Xmx1536m' >> ${TOMCAT_HOME}/bin/setenv.sh

COPY target/app.war ${TOMCAT_HOME}/webapps/ROOT.war

CMD ${TOMCAT_HOME}/bin/catalina.sh run
```

啟動時必須提供 *.crt* 跟 *.key* 檔案, 並且必須 mount 成 ***server.crt*** 及 ***server.key*** 兩個檔案名字 

```
$ docker run -it-d  -p 80:8080 -p 443:8443 \
    -v /path/to/.crt:/opt/tomcat/conf/server.crt \
    -v /path/to/.key:/opt/tomcat/conf/server.key \
    my-ssl-tomcat
```

在 run 的時候如果把自己的 `server.xml` mount 進去, 則可以覆蓋預設的版本 (例如想將 *crt* 改成使用 *jks*)

```
$ docker run -itd  -p 80:8080 -p 443:8443 \
    -v /path/to/server.xml:/opt/tomcat/conf/server.xml \
    -v /path/to/.crt:/opt/tomcat/conf/server.crt \
    -v /path/to/.key:/opt/tomcat/conf/server.key \
    my-ssl-tomcat
```
