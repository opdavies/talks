.. footer:: @opdavies

Building static websites with Sculpin
#####################################

|

.. class:: titleslideinfo

Oliver Davies (@opdavies)

.. page:: imagePage

.. image:: images/druplicon.png
   :width: 10cm

.. raw:: pdf

    PageBreak

.. image:: images/sculpin.png
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
* Learning YAML and Twig (and some Symfony)

Installation
============

``composer require sculpin/sculpin``

|

``composer create-project sculpin/blog-skeleton my-blog``

|

``composer create-project opdavies/sculpin-skeleton my-site``

Using Sculpin
=============

* Configuration lives in ``app/config``
* Source files live in ``source``.

Generate a site
===============

* ``vendor/bin/sculpin generate``
* ``--server``
* ``--watch``
* ``--env``

source/index.md
===============

.. code-block:: markdown
    :include: code/index.md.txt

output_dev/index.html
=====================

.. code-block:: html

   <!DOCTYPE html>
   <head>
   </head>
   <body>
       <p>Hello, World!</p>
   </body>

Configuration
=============

- Stored in ``app/config``
    - ``sculpin_site.yml``
    - ``sculpin_site_{env}.yml``
- Key-value pairs

.. code-block:: yaml
    :include: code/configuration.txt

Using on pages
==============

.. code-block:: html

   <!DOCTYPE html>
   <head>
       <title>{{ site.name }}</title>
   </head>

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

Layouts
=======

.. code-block:: twig

    {# source/_layouts/app.html.twig #}

    <!DOCTYPE html>
    <html lang="{{ site.locale|default('en') }}">
        <head>
            <title>{{ site.name|default('Sculpin Skeleton') }}</title>
        </head>
        <body>
            {% block body %}{% endblock %}
        </body>
    </html>

Layouts
=======

.. code-block:: twig

    {# source/_layouts/default.html.twig #}

    {% extends 'app' %}

    {% block body %}
        {% block content %}{% endblock %}
    {% endblock %}

Includes
========

.. code-block:: twig

    {% include 'about-author' with {
        avatar: site.avatar,
        work: site.work,
    } only %}

    {% for link in links %}
        {% include 'menu-link' with { link } only %}
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

.. page:: titlePage

.. class:: centredtitle

Demo

.. page:: standardPage

Extending Sculpin
=================

.. code-block:: yaml

    # app/config/sculpin_kernel.yml

    ...

    services:
        App\TwigExtension\TalkExtension:
            tags:
                - { name: twig.extension }

.. page:: imagePage

.. image:: images/packagist.png
   :width: 22cm

.. page:: standardPage


.. code-block:: php
   :startinline: true

    // app/SculpinKernel.php

    use Opdavies\Sculpin\Bundle\TwigMarkdownBundle\SculpinTwigMarkdownBundle;
    use Sculpin\Bundle\SculpinBundle\HttpKernel\AbstractKernel;

    final class SculpinKernel extends AbstractKernel
    {
        protected function getAdditionalSculpinBundles(): array
        {
            return [
                SculpinTwigMarkdownBundle::class,
            ];
        }
    }

Thanks!
=======

References:

* https://sculpin.io
* https://github.com/opdavies/sculpin-talk-demo
* https://github.com/opdavies/oliverdavies.uk
* https://github.com/opdavies/docker-image-sculpin-serve

|

Me:

* https://www.oliverdavies.uk
