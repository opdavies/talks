#!/bin/sh

set -e

docker run --rm \
  -v $(pwd):/rst2pdf \
  -v $(pwd)/../styles:/rst2pdf/styles \
  -v $(pwd)/../images:/rst2pdf/images \
  -v $(pwd)/images:/rst2pdf/images2 \
  opdavies/rst2pdf \
  slides.rst \
    -e preprocess \
    -b 2 \
    -s styles/main.style
