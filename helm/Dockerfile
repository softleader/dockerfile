FROM softleader/alpine
MAINTAINER softleader.com.tw

RUN apk update \
		&& apk --no-cache add openssl git make \
		&& rm -rf /var/cache/apk/* \
		&& curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash \
		&& helm init -c \
		&& helm plugin install https://github.com/shihyuho/helm-values \
		&& helm plugin install https://github.com/softleader/helm-filter

WORKDIR /data

ENTRYPOINT [ "helm" ]
