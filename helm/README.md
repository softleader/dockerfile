# SoftLeader Helm

```
$ docker pull softleader/helm
```

## package.sh

Package SoftLeader Product for different environments and client:

```sh
docker run --rm -it \
	-v $(pwd):/data \
	--entrypoint bash \
	softleader/helm \
	-c "curl https://raw.githubusercontent.com/softleader/dockerfile/master/helm/package | bash -s $1 $2 $3..."
```

- `$1` - chart 位置
- `$2之後` - 要 merge 的 values.yaml 位置 

### Examples

資料夾結構如下:

```sh
.<在這邊下指令>
├── mychart
│   ├── Chart.yaml
│   ├── charts
│   ├── templates
│   │   ├── NOTES.txt
│   │   ├── _helpers.tpl
│   │   ├── deployment.yaml
│   │   ├── ingress.yaml
│   │   └── service.yaml
│   └── values.yaml
└── myenv
    ├── client-a.yaml
    ├── sit.yaml
    └── uat.yaml
```

指令:

```
docker run --rm -it \
	-v $(pwd):/data \
	--entrypoint bash \
	softleader/helm \
	-c "curl https://raw.githubusercontent.com/softleader/dockerfile/master/helm/package.sh | bash -s mychart myenv/uat.yaml myenv/client-a.yaml"
```

