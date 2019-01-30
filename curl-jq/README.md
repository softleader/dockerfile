# curl-jq

給沒有裝 curl 或 jq 的電腦 (客戶或工程師自己的電腦) 也可以使用 curl 或 jq

```sh
docker run -t softleader/curl-jq "-sS https://icp.softleader.com.tw/eureka-jasmine-uat/registry | jq .application | jq length"
```

> install jq - [https://stedolan.github.io/jq/download/](https://stedolan.github.io/jq/download/)
