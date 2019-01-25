# softleader/redis:protected

## How to use

```
$ docker pull softleader/redis:protected
```

## What it do

- 啟用 protected-mode, 以禁止redis-cli的部分操作, 避免公開的 redis 遭受 attempted attack
    > ref# https://github.com/antirez/redis/issues/3594#issuecomment-394598143
