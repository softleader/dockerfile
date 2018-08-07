# SoftLeader Helm

```
$ docker pull softleader/helm
```

## Package
Package SoftLeader Product for different environments and client:

```sh
docker run --rm -it \
  -v $(pwd):/data \
  --entrypoint bash softleader/helm \
  -c "curl https://raw.githubusercontent.com/softleader/dockerfile/master/helm/package | bash -s $1 $2 $3..."
```

- `$(pwd)` - 當前目錄
- `$1` - chart 位置
- `$2之後` - 要 merge 的 values.yaml 位置 

### Example

資料夾結構如下:

```sh
.<在這邊下指令>
├── myenv
│   ├── client-a.yaml
│   ├── sit.yaml
│   └── uat.yaml
└── product
    └── mychart
        ├── Chart.yaml
        ├── charts
        ├── templates
        └── values.yaml
```

指令:

```
docker run --rm -it \
  -v $(pwd):/data \
  --entrypoint bash softleader/helm \
  -c "curl https://raw.githubusercontent.com/softleader/dockerfile/master/helm/package | bash -s product/mychart myenv/uat.yaml myenv/client-a.yaml"
```

