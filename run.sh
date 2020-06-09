#!/bin/bash 
# Serves so that drafts are visible as posts and all output is hidden. Errors
# are also hidden (2>&1 sends stderr to stdout which is hidden. 

bundle exec jekyll serve --drafts --livereload
