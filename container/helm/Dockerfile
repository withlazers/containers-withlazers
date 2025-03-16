FROM alpine:3.21

ARG HELM=3.17.0

RUN wget -O- https://get.helm.sh/helm-v${HELM}-linux-amd64.tar.gz | \
		tar -C /usr/local/bin --strip-components=1 -xz linux-amd64/helm
