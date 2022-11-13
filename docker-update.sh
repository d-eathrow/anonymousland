#!/bin/bash

docker run --rm \
  --name=site \
  --network=site \
  --volume="$PWD:/srv/jekyll:Z" \
  --volume="$PWD/vendor/bundle:/usr/local/bundle:Z" \
  -it jekyll/jekyll \
   gem update