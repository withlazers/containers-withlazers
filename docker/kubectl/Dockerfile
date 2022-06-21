FROM alpine:3.16

ARG KUBECTL_VERSION=1.24.2-r1

RUN apk add --no-cache \
		--repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
		"kubectl=$KUBECTL_VERSION"
