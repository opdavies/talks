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
    :hl_lines: 5 6 7
    :linenos:

.. raw:: pdf

    TextAnnotation "Overrides all colours."

Extending configuration
=======================

.. code-block:: javascript
    :include: code/extending-colours.txt
    :hl_lines: 5 6 7 8 9
    :linenos:

.. raw:: pdf

    TextAnnotation "Extends Tailwind's default colours."

Additional options
==================

.. code-block:: javascript
    :include: code/additional-config-options.txt
    :hl_lines: 2 3 4
    :linenos:

.. page:: titlePage

.. class:: centredtitle

``npx tailwind init --full``
