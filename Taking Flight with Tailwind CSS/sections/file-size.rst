.. page:: titlePage

.. class:: centredtitle

Keeping Things Small: Controlling the File size

.. page:: titlePage

.. class:: centredtitle

Disabling unused variants and core plugins

.. page:: standardPage

Default variants
================

.. code-block:: javascript
    :include: code/15-variants-before.txt
    :linenos:

Updated variants
================

.. code-block:: diff 
    :include: code/16-variants-after.txt

.. page:: titlePage

.. class:: centredtitle

Manually removing unused or unwanted classes

.. page:: standardPage

.. code-block:: javascript
    :include: code/17-config-before.txt

.. page::

.. code-block:: diff 
    :include: code/18-config-after.txt

.. raw:: pdf

    TextAnnotation "Needs to be done manually"

.. page:: titlePage

.. class:: centredtitle

Automatically removing unused classes

.. page::

.. class:: centredtitle

Tailwind + PurgeCSS

.. page:: standardPage

PurgeCSS configuration
======================

.. code-block:: javascript
    :include: code/19-purge-config.txt
    :linenos:

.. page:: titlePage

.. class:: centredtitle

``npx encore dev``

.. page::

.. class:: centredtitle

``NODE_ENV=production
npx encore prod``
