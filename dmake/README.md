# SoftLeader Docker & Make

```sh
$ docker pull softleader/dmake
```

> 讓 windows 系統的使用者也可以不用額外安裝或設定就可以使用 make 指令, 並且可以在 make 中操作本機的 docker

若你使用 windows, 推薦先參考 [Chocolatey](https://chocolatey.org/packages/make) 直接安裝 make

## Usage

- windows-cmd:

```sh
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v "%cd%":/data softleader/dmake <target>
```

- windows-powershell:

```sh
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${pwd}:/data softleader/dmake <target>
```

- unix:

```sh
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$(pwd)":/data softleader/dmake <target>
```
