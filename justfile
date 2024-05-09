pdf_filename := 'slides.pdf'
thumbnail_filename := 'thumbnail.jpg'

default:
  @just --list

clean:
  rm -fr dist/*
  touch dist/.keep

  find . \
    -type f \( -name "{{ pdf_filename }}" -o -name *.build_temp -o -name {{ thumbnail_filename }} \) \
    -delete

generate talk_path filename="slides.rst": (generate-pdf talk_path filename)

generate-pdf talk_path filename="slides.rst":
  #!/usr/bin/env bash
  set -o errexit
  set -o nounset

  talk_slug=$(basename {{ talk_path }})

  pushd "{{ talk_path }}"

  rst2pdf {{ filename }} \
    --break-level 1 \
    -e preprocess \
    --fit-background-mode scale \
    --font-path ../fonts \
    --output "../../dist/${talk_slug}.pdf" \
    --stylesheets opdavies-light,igor \
    --stylesheet-path ../styles

  popd

  tree dist
