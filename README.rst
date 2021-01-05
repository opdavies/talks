Talks and Presentations by Oliver Davies
########################################

For talk abstracts, event information, and links to video recordings and the generated slides, see my `talks page`_.

.. _talks page: https://www.oliverdavies.uk/talks

Watching for changes and automatically regenerating
===================================================

The easiest way to do this is using nodemon_::

    nodemon \
      --watch slides.rst \
      --watch *.style \
      --exec 'rst2pdf slides.rst --stylesheets main --break-level 1 --fit-background-mode scale'

.. _nodemon: https://nodemon.io
