.. page:: titlePage

.. class:: centredtitle

How do I install Tailwind?

.. page::

.. class:: centredtitle

1\. Use the CDN

|

https://unpkg.com/tailwindcss/dist/tailwind.min.css

.. page:: titlePage

.. class:: centredtitle

To get the most out of Tailwind, you really should install it via npm

.. raw:: pdf

    TextAnnotation "You can't customize Tailwind's default theme."
    TextAnnotation "You can't use any directives like @apply, @variants, etc.."
    TextAnnotation "You can't enable features like group-hover."
    TextAnnotation "You can't install third-party plugins."

.. page::

.. class:: centredtitle

2\. Installing Tailwind via NPM

.. page::

.. class:: centredtitle

``npm install --save-dev
tailwindcss``

.. class:: centredtitle

``yarn add -D tailwindcss``

.. raw:: pdf

    TextAnnotation "Adds it as a dependency to your package.json file"

.. page::

.. class:: centredtitle

Adding Tailwind to your CSS

.. page:: standardPage

Including Tailwind
==================

.. code-block:: css 
    :include: code/1-adding-tailwind-directives.txt
    :linenos:

Adding your own classes
=======================

.. code-block:: css
    :include: code/2-adding-custom-classes.txt
    :linenos:

Adding your own classes (with layers)
=====================================

.. code-block:: css
    :include: code/3-layers.txt
    :linenos:

.. raw:: pdf

    TextAnnotation "Automatically places your code in the right position."
    TextAnnotation "Can be purged if needed."

.. page:: titlePage

.. class:: centredtitle

Processing your CSS with the build command

.. raw:: pdf

    TextAnnotation "Compile the generated CSS Pass through PostCSS and Tailwind."

.. page:: titlePage

.. class:: centredtitle

``npx tailwind build
src/css/tailwind.pcss
-o dist/app.css``

.. page:: standardPage

.. code-block:: css
    :include: code/4-sample-output.txt
    :linenos:

.. raw:: pdf

    TextAnnotation "Small, low-level, re-usable utility classes."

.. page:: titlePage

.. class:: centredtitle

Processing your CSS with Webpack Encore

.. page::

.. class:: centredtitle 

``npm install --save-dev
@symfony/webpack-encore``

.. page:: standardPage

webpack.config.js
=================

.. code-block:: javascript
    :include: code/5-webpack-config.txt

.. raw:: pdf

    TextAnnotation "PostCSS - useful if you're including other PostCSS plugins like PostCSS Nested"

postcss.config.js
=================

.. code-block:: javascript
    :include: code/6-postcss-config.txt

Running Webpack
===============

.. code-block::
    :include: code/7-webpack-output.txt

Adding Tailwind to HTML
=======================

.. code-block:: html
    :include: code/8-html.txt
