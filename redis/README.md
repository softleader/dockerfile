# [DEPRECATED] softleader/redis:protected
此用此 image 將會造成外部系統無法法問 redis
應於redis啟動時設定密碼, 並在相對應的系統設定密碼以具有使用權限

- `docker-compose.yml`
    ```
    redis:
      image: 'redis:alpine'
      command: redis-server --requirepass your_password
    ```

- `bootstrap.yml`
    ```
    spring:
      redis:
        host: localhost
        password: your_password
    ```

## How to use

```
$ docker pull softleader/redis:protected
```

## What it do

- 啟用 protected-mode, 以禁止redis-cli的部分操作, 避免公開的 redis 遭受 attempted attack
    > ref# https://github.com/antirez/redis/issues/3594#issuecomment-394598143
