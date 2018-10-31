# SoftLeader Docker & Make

此 image 推薦給不想額外安裝程式就要可以使用 make 指令, 並且可以在 make 中操作本機的 docker 的使用者

```sh
$ docker pull softleader/dmake
```

> 若你使用 windows, 推薦先參考 [Chocolatey](https://chocolatey.org/packages/make) 直接安裝 make

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
