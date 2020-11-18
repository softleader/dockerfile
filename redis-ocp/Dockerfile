FROM library/redis:5-alpine
COPY redis.conf /usr/local/etc/redis/redis.conf
WORKDIR /tmp
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]