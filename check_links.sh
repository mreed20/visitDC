#!/usr/bin/env bash

set -u
set -e
bundle exec jekyll build
bundle exec htmlproofer ./_site
