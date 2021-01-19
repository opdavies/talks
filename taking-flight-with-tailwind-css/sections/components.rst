
.. page:: titlePage

.. class:: centredtitle

How I deal with repetition?

.. page::

.. class:: centredtitle

Avoid repetition by extracting components

.. page::

.. class:: centredtitle

Does something justify becoming a component?

.. page::

.. class:: centredtitle

Could the duplication be moved elsewhere?

.. raw:: pdf

    TextAnnotation "Twig partials, Vue components, WordPress template parts."

.. page:: standardPage

Loops
=====

.. code-block:: twig 
    :include: code/20-loops.txt
    :linenos:

Includes
========

.. code-block:: twig 
    :include: code/21-includes.txt
    :linenos:

.. raw:: pdf

    TextAnnotation "Move the duplicate markup into a partial, so there's only one version. Pass data in."

Extracting CSS components
=========================

.. code-block:: css 
    :include: code/css-apply-before.txt
    :linenos:

Extracting CSS components
=========================

.. code-block:: css 
    :include: code/css-apply-after.txt
    :linenos:
