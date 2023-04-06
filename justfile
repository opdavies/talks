_default:
  @just --list

clean name:
  find {{ name }} -type f -name *.pdf -or -name *.rst.build_temp -delete

generate name: (clean name)
  cd {{ name }} \
    && rst2pdf {{ name }}.rst \
      --break-level 1 \
      -e preprocess \
      --fit-background-mode scale \
      --font-path ../fonts \
      --output {{ name }}.pdf \
      --stylesheets opdavies-light,tango,vs \
    && rst2pdf {{ name }}.rst \
      --break-level 1 \
      -e preprocess \
      --fit-background-mode scale \
      --font-path ../fonts \
      --output {{ name }}-dark.pdf \
      --stylesheets opdavies-dark,tango,monokai

thumbnail name slideNumber:
  pdftoppm {{ name }}/{{ name }}.pdf -png -f {{ slideNumber }} -l {{ slideNumber }} > {{ name }}/{{ name }}-{{ slideNumber }}.png
