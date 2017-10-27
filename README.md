# SoftLeader tomcat ssl image

> 依賴了 [softleader/tomcat](https://github.com/softleader/dockerfile/tree/master/tomcat)

## Certificates

此 image 的 `server.xml` 已開啟了 8443 的 connector, 查看更多的設定: [SSL/TLS Configuration HOW-TO](https://tomcat.apache.org/tomcat-8.5-doc/ssl-howto.html)

```xml
<Connector port="8443" 
   maxHttpHeaderSize="8192" 
   maxThreads="150" 
   minSpareThreads="25" 
   maxSpareThreads="75" 
   enableLookups="false" 
   disableUploadTimeout="true" 
   acceptCount="100" 
   scheme="https" 
   secure="true" 
   SSLEnabled="true" 
   clientAuth="false" 
   sslProtocol="TLS" 
   SSLCertificateFile="/certs/server.crt"
   SSLCertificateKeyFile="/certs/server.key" />```

一個簡單的 *Dockerfile* 範例

```
# my-ssl-tomcat

FROM softleader/tomcat85ssl
COPY target/app.war ${TOMCAT_HOME}/webapps/ROOT.war
CMD ${TOMCAT_HOME}/bin/catalina.sh run
```

在執行時, 記得把以下檔案 mount 出來加以控制:

```
docker run -itd -p 80:8080 -p 443:8443 \
	-v /path/to/server.xml:/opt/tomcat/conf/server.xml \
	-v /path/to/server.crt:/certs/server.crt \
	-v /path/to/server.key:/certs/server.key \
	my-ssl-tomcat
```

或是利用 `docker-compose` 執行:

```yaml
my-ssl-tomcat:
  image: my-ssl-tomcat
  ports:
    - "80:8080"
    - "443:8443"
  volumes:
    - /path/to/server.xml:/opt/tomcat/conf/server.xml
    - /path/to/server.crt:/certs/server.crt
    - /path/to/server.key:/certs/server.key
```
