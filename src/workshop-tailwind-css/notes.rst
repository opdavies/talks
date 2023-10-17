Generating the combined PDF
---------------------------

.. code-block::

    pdftk A=slides.pdf B='FLDC 2021 Presenter Slides.pdf' cat A1 B3-4 A2-79 B5-6 output combined.pdf
