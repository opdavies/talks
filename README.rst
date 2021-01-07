Talks and Presentations by Oliver Davies
########################################

For talk abstracts, event information, and links to video recordings and the generated slides, see my `talks page`_.

.. _talks page: https://www.oliverdavies.uk/talks

Watching for changes and automatically regenerating
===================================================

The easiest way to do this is using nodemon_::

    nodemon \
      --ext rst,style,txt \
      --exec "rst2pdf slides.rst \
        --output slides.pdf \
        --stylesheets main \
        --break-level 1 \
        --fit-background-mode scale \
        --extension-module preprocess"

.. _nodemon: https://nodemon.io
