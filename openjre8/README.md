# SoftLeader openjre8

## JRE Runtime

- *softleader/openjre8* - OpenJDK8 base image with root user, useful for developer testing environments.
- *softleader/openjre8:font* - OpenJDK 8 base runtime image w/ root user and fonts

---

- *softleader/openjre8:lts* - Long Term Supports OpenJDK 8 image.
- *softleader/openjre8:lts-font* - Long Term Supports OpenJDK 8 image for softleader/openjre8:font 

### LTS images

LTS image 會被 SoftLeader 長期維護, 並以符合各家客戶 Production 考量來調整 Image 內容, LTS 使用以下權限執行 container, 如果有 mount host volume, 請確保 host volume 使用相同的 uid:

- user - softleader
- uid - 1000
- group - softleader
- gid - 1000

啟動 container 時以下目錄均已事先 grant 好權限給 softleader group, 請將 app 的任何 file systems 寫出都放置在以下目錄中

- */var/softleader_home* ($SL_HOME) - home directory for softleader user.
- */var/softleader_home/dumps* ($SL_DUMPS) - where the directory keeps heap dump files.
- */tmp* - where a Spring Boot application creates working directory for Tomcat by default.

## Build Env 

- *softleader/openjdk8:font.build-env* - Build env for openjre8:font 
