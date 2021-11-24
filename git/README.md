# Git

Base Image 來自 [bitnami](https://github.com/bitnami/bitnami-docker-git), 公司額外針多安裝了 [GitHub CLI](https://cli.github.com/) 讓 Pipeline 中操作 GitHub 更方便些

```sh
docker pull harbor.softleader.com.tw/library/git:2
```
## Build image

[`build-image.sh`](./build-image.sh) 會執行上述所有 image 的 docker build 及 docker push

- 參數傳入 `ls` 列出所有支援的 image tag:

```sh
sh build-image.sh ls
```

- 傳入特定 `tag` 只打包單一 image tag, 如:

```sh
sh build-image.sh 2
```

- 什麼都不傳入打包所有 tag:

```sh
sh build-image.sh 
```

[`build-image-no-cache.sh`](./build-image-no-cache.sh) 的用法跟上面完全一樣, 只差別在打包的過程中不會參考 docker layer cache, 通常用於強制更新 base image 來解決上層 image 被掃出來的 security issue

## GitHub Action

由於松凌會長期維護此 base image, 因此有設定 [GitHub Action](../.github/workflows/git.yml) 每天定期更新, 以隨時獲得最新的 security issue fix
