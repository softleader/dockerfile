# Azul Zulu

> 若需要請參考 [`../adoptopenjdk`](../adoptopenjdk) 版本

公司維護的 JRE Base Image 的上層依賴了 [Azul Zulu](https://www.azul.com/products/zulu-enterprise/jdk-comparison-matrix/), 另外會再多處理如 TimeZone 等常見的共通性設定, 包含了 Java 8, Java 11 等專案中常用的 JRE 版本:

```sh
# Java 8
$ docker pull harbor.softleader.com.tw/library/zulu-openjdk-alpine:8-jre-taipei
$ docker pull harbor.softleader.com.tw/library/zulu-openjdk-alpine:8-font-jre-taipei

# Java 11
$ docker pull harbor.softleader.com.tw/library/zulu-openjdk-alpine:11-jre-taipei
$ docker pull harbor.softleader.com.tw/library/zulu-openjdk-alpine:11-font-jre-taipei
```

> font 版本的內含了 [DejaVu](https://dejavu-fonts.github.io/) 字型, image 大約會比無 font 版本的多 10mb, 通常會用在 pdf 匯出指定字型的需求上

## Build image

[`build-image.sh`](./build-image.sh) 會執行上述所有 image 的 docker build 及 docker push

- 參數傳入 `ls` 列出所有支援的 image tag:

```sh
sh build-image.sh ls
```

- 傳入特定 `tag` 只打包單一 image tag, 如:

```sh
sh build-image.sh 11-jre-taipei
```

- 什麼都不傳入打包所有 tag:

```sh
sh build-image.sh 
```

[`build-image-no-cache.sh`](./build-image-no-cache.sh) 的用法跟上面完全一樣, 只差別在打包的過程中不會參考 docker layer cache, 通常用於強制更新 base image 來解決上層 image 被掃出來的 security issue

## GitHub Action

由於松凌會長期維護此 base image, 因此有設定 [GitHub Action](../.github/workflows/azul-zulu.yml) 每天定期更新, 以隨時獲得最新的 security issue fix
