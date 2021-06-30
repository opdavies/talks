#!/bin/sh

set -e

RST_FILENAME="slides.rst"
TALK_NAME="deploying-php-ansible-ansistrano"
MODE="dark"

docker run --rm \
  -v $PWD:/rst2pdf \
  -v $HOME/.local/share/fonts:/usr/share/fonts \
  -w /rst2pdf/${TALK_NAME} \
  opdavies/rst2pdf \
    ${RST_FILENAME} \
    --break-level 1 \
    --extension-module preprocess \
    --fit-background-mode scale \
    --font-path /usr/share/fonts \
    --output slides-${MODE}.pdf \
    --stylesheets opdavies-${MODE},tango
