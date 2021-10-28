# Maven

Base Image 來自 [https://github.com/carlossg/docker-maven](https://github.com/carlossg/docker-maven), 公司額外針對 maven 3.8 之後預設不能連 http repository 這問題來做處理

## Build image

[`build-image.sh`](./build-image.sh) 會執行上述所有 image 的 docker build 及 docker push

- 參數傳入 `ls` 列出所有支援的 image tag:

```sh
sh build-image.sh ls
```

- 傳入特定 `tag` 只打包單一 image tag, 如:

```sh
sh build-image.sh 3-eclipse-temurin-11
```

- 什麼都不傳入打包所有 tag:

```sh
sh build-image.sh 
```

[`build-image-no-cache.sh`](./build-image-no-cache.sh) 的用法跟上面完全一樣, 只差別在打包的過程中不會參考 docker layer cache, 通常用於強制更新 base image 來解決上層 image 被掃出來的 security issue

## GitHub Action

由於松凌會長期維護此 base image, 因此有設定 [GitHub Action](../.github/workflows/azul-zulu.yml) 每天定期更新, 以隨時獲得最新的 security issue fix