# Redoc CLI

A Container version for [Redoc CLI](https://redocly.com/docs/redoc/deployment/cli/)

## Build

```sh
./build-image.sh
```

## Usage

```sh
docker run -v $(pwd):/data harbor.softleader.com.tw/library/redoc-cli build /data/openapi.json
```
