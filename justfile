pdf_filename := 'slides.pdf'
rst_filename := 'slides.rst'
thumbnail_filename := 'thumbnail.jpg'

default:
  @just --list

clean:
  rm -fr dist/*
  touch dist/.keep

  find . \
    -type f \( -name "{{ pdf_filename }}" -o -name *.build_temp -o -name {{ thumbnail_filename }} \) \
    -delete

generate name: (generate-pdf name)

generate-pdf name:
  cd src/{{ name }} && rst2pdf {{ rst_filename }} \
    --break-level 1 \
    -e preprocess \
    --fit-background-mode scale \
    --font-path ../fonts \
    --output ../../dist/{{ name }}.pdf \
    --stylesheets opdavies-light,tango \
    --stylesheet-path ../styles

  tree dist

present name:
  pdfpc "dist/{{ name }}.pdf"
