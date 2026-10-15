# Maven

Base Image 來自 [ghcr.io/carlossg/maven](https://ghcr.io/carlossg/maven), 公司額外針對 maven 3.6 之後預設不能連 http repository 這問題來做處理，另外我們還放了 docker cli 因為 App 執行測試的過程中會用到 [Testcontainers](https://www.testcontainers.org/) 而這個套件需要 docker!

```sh
# GraalVM for build native
docker pull harbor.softleader.com.tw/library/maven:3-graalvm-community-25
docker pull harbor.softleader.com.tw/library/maven:3-graalvm-community-21

# 公司只針對 eclipse-temurin 維護多種 Java 版本
docker pull harbor.softleader.com.tw/library/maven:3-eclipse-temurin-25
docker pull harbor.softleader.com.tw/library/maven:3-eclipse-temurin-21
docker pull harbor.softleader.com.tw/library/maven:3-eclipse-temurin-17
docker pull harbor.softleader.com.tw/library/maven:3-eclipse-temurin-11
docker pull harbor.softleader.com.tw/library/maven:3-eclipse-temurin-8

# 若有 Azul Zulu 的 Java 版本需求，請提出評估後才加上
docker pull harbor.softleader.com.tw/library/maven:3-azulzulu-17
docker pull harbor.softleader.com.tw/library/maven:3-azulzulu-11
```

## Maven 版本固定在 3.9

上述 image tag 雖然是 `3-*`，但 base image 固定使用 `ghcr.io/carlossg/maven:3.9-*`，不跟著上游的 `3-*` 升到 3.10。

上游的 `3-*` 在 2026-10-11 從 Maven 3.9.16 換成 3.10.0，週日排程重建後，Jenkins 的 Maven build 從約 2 分鐘拉長到數十分鐘甚至數小時：

- Maven 3.10 改用 Resolver 2，預設的 lock 從只在同一個 JVM 內互斥的 `rwlock-local` 改成跨程序的 `file-lock`，每解析一個 artifact 都要在 `~/.m2/repository/.locks` 建立並刪除 lock 檔
- Jenkins 的 `~/.m2` 是所有 pod 共用的 NFS PVC，同時執行的 build 都在同一個目錄建檔刪檔，全部卡在 NFS 上排隊

`3.9-*` 仍會拿到 3.9.x 的修補版本，也保留每週重建取得 security fix 的用意。升級到 3.10 以上之前，先讓 `~/.m2` 不再由多個 pod 透過 NFS 共用（例如改成每台節點本機的 hostPath），再改回 `3-*`。

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

[`build-image-no-cache.sh`](./build-image-no-cache.sh) 的用法跟上面完全一樣，只差別在打包的過程中不會參考 docker layer cache, 通常用於強制更新 base image 來解決上層 image 被掃出來的 security issue

## GitHub Action

由於松凌會長期維護此 base image, 因此有設定 [GitHub Action](../.github/workflows) 每天定期更新，以隨時獲得最新的 security issue fix
