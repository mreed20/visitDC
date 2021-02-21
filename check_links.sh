#!/usr/bin/env bash

set -u
set -e
bundle exec jekyll build
bundle exec htmlproofer --assume-extension ./_site
