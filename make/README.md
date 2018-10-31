# SoftLeader Make

```sh
$ docker pull softleader/make
```

> 讓 windows 系統的使用者也可以不用額外安裝或設定就可以使用 make 指令

## Usage

- windows-cmd:

```sh
$ docker run -it --rm -v "%cd%":/data softleader/make <target>
```

- windows-powershell:

```sh
$ docker run -it --rm -v ${pwd}:/data softleader/make <target>
```

- unix:

```sh
$ docker run -it --rm -v "$(pwd)":/data softleader/make <target>
```
