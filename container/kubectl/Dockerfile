FROM alpine:3.21

ARG KUBECTL_VERSION=1.32.2-r0

RUN apk add --no-cache \
		--repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
		"kubectl=$KUBECTL_VERSION"
