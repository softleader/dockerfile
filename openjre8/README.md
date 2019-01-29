# SoftLeader openjre8

## Runtime

- softleader/openjre8 - OpenJDK8 base image with root user, useful for developer testing environments.
- softleader/openjre8:font - OpenJDK 8 base runtime image w/ root user and fonts

- softleader/openjre8:lts - Long Term Supports OpenJDK 8 image.
- softleader/openjre8:font-lts - Long Term Supports OpenJDK 8 image for softleader/openjre8:font 

### LTS images

LTS image 使用以下權限執行 container:

- user - softleader
- uid - 1000
- group - softleader
- gid - 1000

如果有 mount host volume, 請確保 host volume 使用相同的 uid

在 LTS 中以下目錄均以事先 grant 好權限給 softleader group

- */var/softleader_home* ($SL_HOME) - home directory for softleader user.
- */var/softleader_home/dumps* ($SL_DUMPS) - where the directory keeps heap dump files.
- */tmp* - where a Spring Boot application creates working directory for Tomcat by default. 

## Build Env 

- softleader/openjdk8:font.build-env - Build env for openjre8:font 
