# CodeQL

### build
`docker build -t local/code-ql .`

### run
> 目前測試 softleader-erp 需要跑一個小時

sh:
```shell
docker run --rm \
  -e JAVA_VERSION=21 \
  -v ${PWD}:/workspace \
  local/code-ql:latest \
  java-select bash -c "rm -rf db && codeql database create db --language=java --source-root /workspace --threads=0 && codeql database analyze db codeql/java-queries --format=sarifv2.1.0 --output=/workspace/results.sarif --threads=0"
```

pwsh:
```powershell
docker run --rm `
  -e JAVA_VERSION=21 `
  -v ${PWD}:/workspace `
  local/code-ql:latest `
  java-select bash -c "rm -rf db && codeql database create db --language=java --source-root /workspace --threads=0 && codeql database analyze db codeql/java-queries --format=sarifv2.1.0 --output=/workspace/results.sarif --threads=0"
```

- ENVs
  - JAVA_VERSION
    - 11
    - 17
    - 21
    - 25
