FROM alpine:3.21

ARG TARGETARCH
ARG HELM=3.17.2
ARG HELM_DIFF=3.10.0
ARG HELM_GIT=1.3.0
ARG HELMFILE=0.171.0

RUN set -x; apk add git openssh-client-default && \
	wget -O- https://get.helm.sh/helm-v${HELM}-linux-${TARGETARCH}.tar.gz | \
		tar -C /usr/local/bin --strip-components=1 -xz linux-${TARGETARCH}/helm && \
	wget -O- https://github.com/helmfile/helmfile/releases/download/v${HELMFILE}/helmfile_${HELMFILE}_linux_${TARGETARCH}.tar.gz | \
		tar -C /usr/local/bin -xz helmfile && \
	helm plugin install --version ${HELM_DIFF} https://github.com/databus23/helm-diff && \
	helm plugin install --version ${HELM_GIT} https://github.com/aslafy-z/helm-git && \
	chmod +x /usr/local/bin/*
