.. page:: titlePage

.. class:: centredtitle

Customising Tailwind

.. page::

.. class:: centredtitle

``npx tailwind init``

.. page:: standardPage

tailwind.config.js
==================

.. code-block:: javascript
   :include: code/tailwind-basic-config.txt
   :linenos:


Overriding configuration
========================

.. code-block:: javascript
   :include: code/override-colours.txt
   :linenos:
   :hl_lines: 5 6 7

.. raw:: pdf

    TextAnnotation "Overrides all colours."

Extending configuration
=======================

.. code-block:: javascript
   :linenos:
   :include: code/extending-colours.txt
   :hl_lines: 5 6 7 8 9

.. raw:: pdf

    TextAnnotation "Extends Tailwind's default colours."

.. page:: titlePage

.. class:: centredtitle

``npx tailwind init --full``

.. raw:: pdf

   PageBreak titlePage
