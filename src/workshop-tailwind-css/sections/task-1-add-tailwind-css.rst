.. page:: titlePage

.. class:: centredtitle

Task 1: Adding Tailwind CSS

.. page:: standardPage

.. code-block:: bash
    :include: code/adding-tailwind.txt
    :end-before: -- adding tailwind

.. page::

Create the source file:

|

.. code-block:: css
    :include: code/adding-tailwind.txt
    :start-after: -- adding tailwind
    :end-before: -- adding scripts

.. page::

Add to ``package.json``:

.. code-block:: js
    :include: code/adding-tailwind.txt
    :start-after: -- adding scripts
    :end-before: -- adding the stylesheet

|

Add to ``templates/html.html.twig``:

.. code-block:: html
    :include: code/adding-tailwind.txt
    :start-after: -- adding the stylesheet

.. page:: imagePage

.. image:: images/1-end.png
    :width: 22cm
