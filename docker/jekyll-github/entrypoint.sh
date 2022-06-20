#!/bin/sh -e

bundle install

if [ $# -eq 0 ]; then
	exec bundle exec jekyll serve
elif [ -z "${1##/*}" ]; then
	exec "$@"
else
	exec bundle exec jekyll "$@"
fi
