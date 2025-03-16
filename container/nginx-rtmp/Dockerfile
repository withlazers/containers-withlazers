FROM alpine:3.16
ARG NGINX_VERSION=1.21.6
ARG NGINX_RTMP_MODULE_VERSION=1.2.2
ARG CFLAGS="-static -static-libgcc -Wno-error=implicit-fallthrough -fPIE -fstack-protector-all -D_FORTIFY_SOURCE=2 -flto"
ARG LDFLAGS="-static -Wl,-z,relro -flto"


LABEL maintainer="Enno Boland <eb@s01.de>"

RUN apk add alpine-sdk openssl-dev zlib-dev openssl-libs-static zlib-static pcre-dev

WORKDIR /build

RUN wget -O nginx-rtmp-module.tar.gz https://github.com/arut/nginx-rtmp-module/archive/v${NGINX_RTMP_MODULE_VERSION}.tar.gz && \
	wget -O nginx.tar.gz https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
	tar xf nginx-rtmp-module.tar.gz && \
	tar xf nginx.tar.gz && \
	cd nginx-${NGINX_VERSION} && \
	./configure \
		--add-module=/build/nginx-rtmp-module-${NGINX_RTMP_MODULE_VERSION} \
		--conf-path=/etc/nginx.conf \
		--error-log-path=/dev/stderr \
		--http-log-path=/dev/stdout \
		--lock-path=/tmp/nginx.lock \
		--pid-path=/tmp/nginx.pod \
		--prefix=/tmp \
		--sbin-path=/bin/nginx \
		--with-cc-opt="${CFLAGS}" \
		--with-http_ssl_module \
		--with-http_stub_status_module \
		--with-ipv6 \
		--with-ld-opt="${LDFLAGS}" \
		--with-threads && \
	make -j $(getconf _NPROCESSORS_ONLN) && \
	make install DESTDIR=/dest

FROM gcr.io/distroless/static:nonroot

COPY --from=0 /dest/bin/nginx /bin/nginx
COPY --from=0 --chown=nonroot:nonroot /dest/tmp /tmp
COPY nginx.conf /etc/nginx.conf

EXPOSE 1935
EXPOSE 8080
ENTRYPOINT [ "/bin/nginx", "-g", "daemon off;" ]
