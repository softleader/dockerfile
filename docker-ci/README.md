# Docker CI

供 amd64 Jenkins agent 使用的 Docker/OCI evidence tool image。

```sh
docker pull harbor.softleader.com.tw/library/docker-ci:27.5
```

基於 Docker CLI 27.5，只額外提供：

- Docker Buildx 0.36.1
- bash
- jq
- make
- ripgrep 15.2.0

git、tar、sha256sum 與 wget 已由 Docker CLI base image 提供。Pipeline 不需要 curl、Perl、Kind 或 kubectl，因此不額外安裝。
