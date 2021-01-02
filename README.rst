Talks and Presentations by Oliver Davies
########################################

Watching for changes and automatically regenerating
===================================================

The easiest way to do this is using nodemon_::

    nodemon \
      --watch slides.rst \
      --watch *.style \
      --exec 'rst2pdf slides.rst --stylesheets main --break-level 1'

.. _nodemon: https://nodemon.io
