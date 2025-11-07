FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl wget unzip git zip bash maven && apt-get clean

# 安裝 sdkman
ENV SDKMAN_DIR=/root/.sdkman
RUN curl -s https://get.sdkman.io | bash

SHELL ["/bin/bash", "-c"]

# 安裝多版本 JDK
RUN source "$SDKMAN_DIR/bin/sdkman-init.sh" && \
    sdk install java 11.0.29-tem && \
    sdk install java 17.0.17-tem && \
    sdk install java 21.0.8-tem && \
    sdk install java 25.0.1-tem

# 安裝 CodeQL CLI
ENV CODEQL_VERSION=2.23.3
RUN wget https://github.com/github/codeql-cli-binaries/releases/download/v${CODEQL_VERSION}/codeql-linux64.zip \
  && unzip codeql-linux64.zip \
  && mv codeql /opt/codeql \
  && rm codeql-linux64.zip
ENV PATH="/opt/codeql:${PATH}"

# 建立自動 JDK 切換腳本
RUN cat <<'EOF' > /usr/local/bin/java-select
#!/usr/bin/env bash
if [ -z "$JAVA_VERSION" ]; then echo "JAVA_VERSION not set"; exit 1; fi
source /root/.sdkman/bin/sdkman-init.sh
case "$JAVA_VERSION" in
  11) sdk default java 11.0.29-tem ;;
  17) sdk default java 17.0.17-tem ;;
  21) sdk default java 21.0.8-tem ;;
  25) sdk default java 25.0.1-tem ;;
  *) echo "Unsupported JAVA_VERSION=$JAVA_VERSION"; exit 1 ;;
esac
exec "$@"
EOF
RUN sed -i 's/\r$//' /usr/local/bin/java-select && chmod +x /usr/local/bin/java-select

# 預先拉取常用 Query Packs（以 Java 為例）
RUN codeql pack download codeql/java-all
RUN codeql pack download codeql/java-queries

# 預設工作目錄
WORKDIR /workspace
