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
$ git clone git@github.com:softleader/dockerfile.git
$ cd dockerfile/tomcat85
$ docker build -t softleader/tomcat85 .
```

or pull from docker hud

```
$ docker pull softleader/tomcat85
```

Write a Dockerfile:

```
FROM softleader/tomcat85

# "/tmp" is where a Spring Boot application creates working directories for Tomcat by default.
VOLUME /tmp

RUN echo '#! /bin/sh' > ${TOMCAT_HOME}/bin/setenv.sh
RUN echo 'export JAVA_OPTS="-Xmx1536m -Xmx1536m"' >> ${TOMCAT_HOME}/bin/setenv.sh

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
    -v /path/to/my-server.xml:/opt/tomcat/conf/server.xml \
    my-tomcat
```

## SSL

You can build SSL tomcat image from source code

```
$ git clone git@github.com:softleader/dockerfile.git
$ cd dockerfile/tomcat85
$ docker build -t softleader/tomcat85:ssl -f Dockerfile.ssl .
```

or pull from docker hud

```
$ docker pull softleader/tomcat85:ssl
```

Write a Dockerfile

```
FROM softleader/tomcat85:ssl

# "/tmp" is where a Spring Boot application creates working directories for Tomcat by default.
VOLUME /tmp

RUN echo '#! /bin/sh' > ${TOMCAT_HOME}/bin/setenv.sh
RUN echo 'export JAVA_OPTS="-Xmx1536m -Xmx1536m"' >> ${TOMCAT_HOME}/bin/setenv.sh

COPY target/app.war ${TOMCAT_HOME}/webapps/ROOT.war

CMD ${TOMCAT_HOME}/bin/catalina.sh run
```

*tomcat85:ssl* 的 `server.xml` 會固定加上下述 connector:

```xml
<Connector port="8443" 
    maxHttpHeaderSize="8192"
    maxThreads="150" 
    enableLookups="false" 
    disableUploadTimeout="true" 
    acceptCount="100" 
    scheme="https" 
    secure="true" 
    SSLEngine="on"
    SSLEnabled="true" 
    clientAuth="false" 
    sslProtocol="TLSv1.2"
    sslEnabledProtocols="TLSv1.2"
    xpoweredBy="false"
    SSLCertificateFile="/certs/server.crt"
    SSLCertificateKeyFile="/certs/server.key"
    SSLCertificateChainFile="/certs/chain.crt"/>
```

> see [Tomcat8 SSL Support - Certificate](https://tomcat.apache.org/tomcat-8.5-doc/config/http.html#SSL_Support) for more detail

因此一定會讀取 3 個檔: 

- `/certs/server.crt` - end-user 憑證
- `/certs/server.key` - private key
- `/certs/chain.cert` - 中繼 + root 的串聯憑證

> `$ cat issuing_ca.crt root_ca.crt > chain.crt`

所以要記得 mount 給 container

```
$ docker run -itd -p 80:8080 -p 443:8443 \
    -v /path/to/my-server.crt:/certs/server.crt \
    -v /path/to/my-server.key:/certs/server.key \
    -v /path/to/my-chain.key:/certs/chain.key \
    my-ssl-tomcat
```

如果想要完整控制, 則可把 `server.xml` mount 進去, 以覆蓋預設的版本 (例如想將 *crt* 改成使用 *jks*)

```
$ docker run -itd -p 80:8080 -p 443:8443 \
    -v /path/to/my-server.crt:/certs/server.crt \
    -v /path/to/my-server.key:/certs/server.key \
    -v /path/to/my-chain.key:/certs/chain.key \
    -v /path/to/my-server.xml:/opt/tomcat/conf/server.xml \
    my-ssl-tomcat
```

預設會將所有 *80* 自動轉到 *443*, 可以把自己的 `web.xml` mount 進去覆寫這段

```
$ docker run -itd -p 80:8080 -p 443:8443 \
    -v /path/to/my-server.crt:/certs/server.crt \
    -v /path/to/my-server.key:/certs/server.key \
    -v /path/to/my-chain.key:/certs/chain.key \
    -v /path/to/my-server.xml:/opt/tomcat/conf/server.xml \
    -v /path/to/my-web.xml:/opt/tomcat/conf/web.xml \
    my-ssl-tomcat
```
