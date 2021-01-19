.. page:: titlePage

.. class:: centredtitle

Interaction states

hover, focus, active, disabled, visited,
group-hover, focus-within,
first-child, last-child...

.. page::

.. class:: centredtitle

``[state][separator][class]``

.. raw:: pdf

    TextAnnotation "State = hover, focus, group focus, focus within."
    TextAnnotation "Separator = configurable"
    TextAnnotation "Colon by default"
    TextAnnotation "Class = the same utility class that you would have used normally"

.. page::

.. class:: centredtitle

``hover:text-red-500``

|

.. class:: centredtitle

``focus:text-red-500``

.. page:: standardPage

Interaction states in CSS
=========================

.. code-block:: css
    :include: code/9-hover-classes.txt
    :linenos:

Interaction states in HTML
==========================

.. code-block:: html
    :include: code/10-hover-class-example.txt
    :linenos:

Default variants
================

.. code-block:: javascript
    :include: code/11-default-variants.txt
    :linenos:
