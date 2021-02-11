.. footer:: @opdavies

Soaring with utility-first CSS and Tailwind
===========================================

|

.. class:: titleslideinfo

Oliver Davies (@opdavies)

.. page:: standardPage

Prerequisites
-------------

* PHP
* Composer
* npm/yarn

Adding Tailwind CSS
-------------------

Add Tailwind and its dependencies:

.. code-block:: bash
    :include: code/adding-tailwind.txt
    :end-before: # Generate Tailwind and PostCSS configuration files

|

Generate the configuration files:

.. code-block:: bash
    :include: code/adding-tailwind.txt
    :start-at: # Generate Tailwind and PostCSS configuration files
    :end-before: /* assets/css/tailwind.pcss */

Adding Tailwind CSS
-------------------

Create the source file:

.. code-block:: css
    :include: code/adding-tailwind.txt
    :start-at: /* assets/css/tailwind.pcss */
    :end-before: "scripts": {

Adding Tailwind CSS
-------------------

Add to ``package.json``:

.. code-block:: js
    :include: code/adding-tailwind.txt
    :start-at: "scripts": {
    :end-before: <link rel="stylesheet" href="/build/tailwind.css"/> 

|

Add to ``templates/html.html.twig``:

.. code-block:: html
    :include: code/adding-tailwind.txt
    :start-at: <link rel="stylesheet" href="/build/tailwind.css"/> 

.. page::

.. code-block::
    :include: code/yarn-output-before-purge.txt
    :end-before: # yarn prod

.. page::

.. code-block::
    :include: code/yarn-output-before-purge.txt
    :start-at: # yarn prod

Configuring PurgeCSS
--------------------

.. code-block:: js
    :include: code/configuring-purgecss.txt

.. page::

.. code-block::
    :include: code/yarn-output-after-purge.txt
