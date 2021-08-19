.. footer:: @opdavies

Building static websites with Sculpin
#####################################

|

.. class:: titleslideinfo

Oliver Davies (@opdavies)

.. page:: imagePage

.. image:: druplicon.png
   :width: 10cm

.. page::

.. image:: sculpin.png
   :width: 10cm

.. page:: standardPage

What is Sculpin?
================

* Static site generator
* CLI tool
* Built on Symfony's HttpKernel
* HTML + Markdown + Twig = Static site

What do I use it for?
=====================

* My personal website
* Some client websites
* HTML prototypes and testing
* Learning YAML and Twig (and maybe some Symfony)

Installation
============

``composer require sculpin/sculpin``

Using Sculpin
=============

* Configuration lives in ``app/config``
* Source code lives in ``source``.

Generate a site
===============

* ``sculpin generate``
* ``--server``
* ``--watch``
* ``--env``

source/index.md
===============

.. code-block:: markdown
    :include: code/index.md.txt

Configuration
=============

- Stored in ``app/config``
    - ``sculpin_site.yml``
    - ``sculpin_site_{env}.yml``
- Key-value pairs

.. code-block:: markdown
    :include: code/configuration.txt

YAML front matter
=================

.. code-block:: yaml

    ---
    layout: post
    title: New blog post
    draft: yes
    ---

    # My new blog post

More front matter
=================

.. code-block:: yaml

    ---
    layout: post
    title: New blog post
    draft: yes
    tags:
        - drupal
        - php
        - sculpin
    ---

    # My new blog post



Even more front matter
======================

.. code-block:: yaml

    ---
    layout: post
    title: New blog post
    draft: yes
    tags:
        - drupal
        - php
        - sculpin
    tweets: yes
    foo: bar
    ---

    # My new blog post

Using on pages
==============

.. code-block:: twig

    ---
    ...
    testimonials:
        - { name: ..., role: ..., text: ..., url: ... }
        - { name: ..., role: ..., text: ..., url: ... }
        - { name: ..., role: ..., text: ..., url: ... }
    ---

    {% for testimonial in page.testimonials %}
        <h2>{{ testimonial.name }} - {{ testimonial.role }}</h2>
        <p>{{ testimonial.text }}</p>
    {% endfor %}

Content types
=============

.. code-block:: yaml

    # app/config/sculpin_kernel.yml

    sculpin_content_types:
        projects:
            permalink: projects/:slug_title/

Accessing custom content types
==============================

.. code-block:: yaml

    ---
    title: My Projects
    layout: default
    use:
        - projects
    ---
    {% for project in data.projects %}
        <h2>{{ project.title }}</h2>
    {% endfor %}

Extending Sculpin
=================

* Custom (Symfony) bundles
* Twig extensions
* Other Symfony components or PHP libraries

Thanks!
=======

References:

* https://sculpin.io
* https://github.com/sculpin/sculpin
* https://github.com/opdavies/sculpin-skeleton
* https://github.com/opdavies/docker-image-sculpin-serve

|

Me:

* https://www.oliverdavies.uk
