# Go CI

供 amd64 Jenkins agent 使用的 Go source-quality tool image。

```sh
docker pull harbor.softleader.com.tw/library/go-ci:1.27
```

基於 Go 1.27.0 Bookworm，只額外提供：

- jq
- Kustomize 5.8.1
- yq 4.53.6
- ripgrep 15.2.0

Kind 與 kubectl 不屬於靜態 source-quality gate，因此不包含在此 image。
