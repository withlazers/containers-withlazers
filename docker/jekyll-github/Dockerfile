FROM alpine:3.16 AS build

RUN apk add --no-cache ruby-bundler ruby-dev build-base

WORKDIR /site
COPY Gemfile* .

RUN bundle install && \
	sed -i '/"destination"/s#=> .*#=> "/tmp/site",#' \
		/usr/lib/ruby/gems/*/gems/jekyll-[0-9]*/lib/jekyll/configuration.rb && \
	bundle binstubs --all --path /usr/local/bin && \
	rm -rf /usr/lib/ruby/gems/3.1.0/cache

FROM alpine:3.16

RUN apk add --no-cache ruby-bundler git && \
	git config --global --add safe.directory /site

COPY --from=build /usr/lib/ruby /usr/lib/ruby
COPY --from=build /usr/local/bin /usr/local/bin
COPY entrypoint.sh /entrypoint.sh

WORKDIR /site

ENTRYPOINT ["/entrypoint.sh"]
