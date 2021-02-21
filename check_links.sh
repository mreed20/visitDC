#!/usr/bin/env bash
set -u
# HTML-proofer and Jekyll's 'baseurl' don't play nice together, so build the
# site in a directory (baseurl = visitDC) corresponding to where it would be on
# the web. See https://github.com/jekyll/jekyll/issues/4122
bundle exec jekyll build -d _site/visitDC/
bundle exec htmlproofer --assume-extension ./_site
