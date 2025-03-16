#!/bin/sh -e

bundle install

if [ $# -eq 0 ]; then
	exec jekyll serve
elif [ -z "${1##/*}" ]; then
	exec "$@"
else
	exec jekyll "$@"
fi
