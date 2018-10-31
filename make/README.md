# SoftLeader Make

此 image 推薦給不想額外安裝程式就要可以使用 make 指令的使用者

```sh
$ docker pull softleader/make
```

> 若你使用 windows, 推薦先參考 [Chocolatey](https://chocolatey.org/packages/make) 直接安裝 make

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
