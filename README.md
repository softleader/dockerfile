# dockerfile

> A collection of Dockerfile for SoftLeader

[//]: # (dree - BEGIN)
```
dockerfile
 ├── .editorconfig
 ├─> .git
 │   ├── FETCH_HEAD
 │   ├── HEAD
 │   ├─> branches
 │   ├── config
 │   ├── description
 │   ├─> hooks
 │   │   ├── applypatch-msg.sample
 │   │   ├── commit-msg.sample
 │   │   ├── fsmonitor-watchman.sample
 │   │   ├── post-update.sample
 │   │   ├── pre-applypatch.sample
 │   │   ├── pre-commit.sample
 │   │   ├── pre-merge-commit.sample
 │   │   ├── pre-push.sample
 │   │   ├── pre-rebase.sample
 │   │   ├── pre-receive.sample
 │   │   ├── prepare-commit-msg.sample
 │   │   ├── push-to-checkout.sample
 │   │   ├── sendemail-validate.sample
 │   │   └── update.sample
 │   ├── index
 │   ├─> info
 │   │   └── exclude
 │   ├─> logs
 │   │   ├── HEAD
 │   │   └─> refs
 │   │       ├─> heads
 │   │       │   └── master
 │   │       └─> remotes
 │   │           └─> origin
 │   │               └── master
 │   ├─> objects
 │   │   ├─> info
 │   │   └─> pack
 │   │       ├── pack-2143a1af099c98abda3b724295fa5651692eea6c.idx
 │   │       ├── pack-2143a1af099c98abda3b724295fa5651692eea6c.pack
 │   │       └── pack-2143a1af099c98abda3b724295fa5651692eea6c.rev
 │   ├─> refs
 │   │   ├─> heads
 │   │   │   └── master
 │   │   ├─> remotes
 │   │   │   └─> origin
 │   │   │       └── master
 │   │   └─> tags
 │   └── shallow
 ├─> .github
 │   ├── dependabot.yml
 │   └─> workflows
 │       ├── adoptopenjdk-11.yml
 │       ├── adoptopenjdk-8.yml
 │       ├── azul-zulu-11.yml
 │       ├── azul-zulu-17.yml
 │       ├── azul-zulu-8.yml
 │       ├── eclipse-temurin-17.yml
 │       ├── git.yml
 │       ├── keepalive.yml
 │       ├── maven-jdk11.yml
 │       ├── maven-jdk17.yml
 │       ├── maven-jdk8.yml
 │       └── nginx-unprivileged.yml
 ├── .gitignore
 ├── README.md
 ├─> alpine
 │   ├── .bashrc
 │   ├── Dockerfile
 │   └── README.md
 ├─> ansible
 │   ├── Dockerfile
 │   └── README.md
 ├─> azul-zulu
 │   ├── Dockerfile.11-font-jre-taipei
 │   ├── Dockerfile.11-jre-taipei
 │   ├── Dockerfile.17-font-jre-taipei
 │   ├── Dockerfile.17-jre-taipei
 │   ├── Dockerfile.8-font-jre-taipei
 │   ├── Dockerfile.8-jre-taipei
 │   ├── README.md
 │   ├── build-image-no-cache.sh
 │   ├── build-image.sh
 │   └─> centos
 │       ├── Dockerfile.11-font-jre-taipei
 │       ├── build-image-no-cache.sh
 │       └── build-image.sh
 ├─> base-deprecated
 │   ├── .bashrc
 │   ├── Dockerfile
 │   └── README.md
 ├─> bitnami-nginx-redis
 │   ├── Dockerfile
 │   ├── README.md
 │   └── build-image.sh
 ├─> curl-jq
 │   ├── Dockerfile
 │   ├── Makefile
 │   ├── README.md
 │   └── entrypoint.sh
 ├─> dmake
 │   ├── Dockerfile
 │   └── README.md
 ├─> docker
 │   ├── Dockerfile
 │   ├── Dockerfile.orig
 │   ├── README.md
 │   └── build-image.sh
 ├─> eclipse-temurin
 │   ├── Dockerfile.11-font-jre-taipei
 │   ├── Dockerfile.11-jre-taipei
 │   ├── Dockerfile.17-font-jre-taipei
 │   ├── Dockerfile.17-jre-taipei
 │   ├── Dockerfile.8-font-jre-taipei
 │   ├── Dockerfile.8-jre-taipei
 │   ├── README.md
 │   ├── build-image-no-cache.sh
 │   ├── build-image.sh
 │   └─> centos
 │       ├── Dockerfile.11-font-jre-taipei
 │       ├── build-image-no-cache.sh
 │       └── build-image.sh
 ├─> git
 │   ├── Dockerfile.2
 │   ├── README.md
 │   ├── build-image-no-cache.sh
 │   └── build-image.sh
 ├─> github-cli
 │   ├── Dockerfile
 │   └── build.sh
 ├─> goreleaser
 │   ├── Dockerfile
 │   ├── README.md
 │   ├── entrypoint.sh
 │   └── github_token
 ├─> helm
 │   ├── Dockerfile
 │   ├── README.md
 │   ├── package
 │   └── package_v2
 ├─> ibmcloud-cli
 │   └── Dockerfile
 ├─> ldap-client
 │   ├── Dockerfile
 │   ├── README.md
 │   ├── build.sh
 │   ├── installer
 │   └── sample.ldif
 ├─> ldap-server
 │   ├── Dockerfile
 │   ├── README.md
 │   ├── build.sh
 │   └── installer
 ├─> make
 │   ├── Dockerfile
 │   └── README.md
 ├─> maven
 │   ├── Dockerfile.3-azulzulu-11
 │   ├── Dockerfile.3-azulzulu-17
 │   ├── Dockerfile.3-eclipse-temurin-11
 │   ├── Dockerfile.3-eclipse-temurin-17
 │   ├── Dockerfile.3-eclipse-temurin-17-nodejs
 │   ├── Dockerfile.3-eclipse-temurin-8
 │   ├── README.md
 │   ├── build-image-no-cache.sh
 │   └── build-image.sh
 ├─> maven-git
 │   └── Dockerfile
 ├─> nginx
 │   └── Dockerfile
 ├─> openjdk11-deprecated
 │   ├── .bashrc
 │   ├── Dockerfile
 │   ├── Dockerfile.font
 │   ├── Dockerfile.lts
 │   ├── Dockerfile.lts-docker
 │   ├── Dockerfile.lts-font
 │   ├── Makefile
 │   ├── README.md
 │   └── entrypoint.sh
 ├─> openjdk18-openshift-deprecated
 │   ├── Dockerfile
 │   └── README.md
 ├─> openjre8-deprecated
 │   ├── .bashrc
 │   ├── Dockerfile
 │   ├── Dockerfile.font
 │   ├── Dockerfile.font.build-env
 │   ├── Dockerfile.grpc
 │   ├── Dockerfile.lts
 │   ├── Dockerfile.lts-docker
 │   ├── Dockerfile.lts-font
 │   ├── Makefile
 │   ├── README.md
 │   ├── ensure-config-server.sh
 │   └── entrypoint.sh
 ├─> redis
 │   ├── Dockerfile
 │   ├── README.md
 │   └── redis.conf
 ├─> redis-ocp
 │   ├── Dockerfile
 │   └── redis.conf
 ├─> redoc-cli
 │   ├── Dockerfile
 │   ├── README.md
 │   └── build-image.sh
 ├─> registry
 │   ├── Dockerfile
 │   ├── Dockerfile.2
 │   ├── Makefile
 │   ├── README.md
 │   ├── config.yml
 │   ├── docker-compose-2.yml
 │   └── docker-compose.yml
 ├─> sftp-image
 │   ├── Dockerfile
 │   ├── README.md
 │   ├── build-image.sh
 │   ├── docker-compose.yml
 │   └── sftp-image.sh
 ├─> snapcraft
 │   └── Dockerfile
 ├─> tomcat85
 │   ├── Dockerfile
 │   ├── Dockerfile.ssl
 │   ├── README.md
 │   ├── logging.properties
 │   ├── server-ssl.xml
 │   ├── server.xml
 │   └── web-ssl.xml
 └─> www
     ├── Dockerfile
     ├── README.md
     └── httpd.conf
```
[//]: # (dree - END)
