FROM softleader/alpine
MAINTAINER softleader.com.tw

RUN apk update \
		&& apk --no-cache add openssl \
		&& rm -rf /var/cache/apk/* \
		&& curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh \
		&& chmod 700 get_helm.sh \
		&& ./get_helm.sh \
		&& rm ./get_helm.sh \
		&& helm init -c

WORKDIR /data

ENTRYPOINT [ "helm" ]