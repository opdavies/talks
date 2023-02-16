.. class:: centredtitle

Adding Tailwind to your CSS

.. page:: standardPage

Including Tailwind
==================

.. code-block:: css 
    :linenos:
    :include: code/1-adding-tailwind-directives.txt

Adding your own classes
=======================

.. code-block:: css
    :linenos:
    :include: code/2-adding-custom-classes.txt

Adding your own classes (with layers)
=====================================

.. code-block:: css
    :linenos:
    :include: code/3-layers.txt

.. raw:: pdf

    TextAnnotation "Automatically places your code in the right position."

.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

``npx tailwind
--input src/css/tailwind.pcss
--output dist/tailwind.css``

.. raw:: pdf

   TextAnnotation "As well as the output file, we need to specify the input file."
