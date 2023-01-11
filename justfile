_default:
  @just --list

generate name theme="light":
  cd {{ name }} \
    && rst2pdf {{ name }}.rst \
      --break-level 1 \
      --fit-background-mode scale \
      --font-path ../fonts \
      --output {{ name }}.pdf \
      --stylesheets opdavies-{{ theme }},tango
