.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

Generating configuration files

.. raw:: pdf

   PageBreak standardPage

build-configs
=============

Most of my projects have the same configuration files:

|

* ``Dockerfile``
* ``docker-compose.yaml``
* ``justfile``
* ``phpstan.neon.dist``
* ``phpunit.xml.dist``

.. raw:: pdf

   TextAnnotation "Same files with either the same or similar values. What if, instead of copying and pasting these between projects, I could generate them from a canonical set of templates?"

build-configs
=============

* Symfony/Silly CLI project
* Twig for templating
* Takes values from a `build.yaml` file
* Generates the appropriate files with the correct configuration
* Easier to set up a new project
* Less maintenance overhead
* Can quickly add a new feature and update every project

.. raw:: pdf

   TextAnnotation "Opinionated template files"

build.yaml
==========

.. code-block:: yaml
   :include: code/build.yaml
   :linenos:

Dockerfile.twig
===============

.. code-block:: Dockerfile
   :include: code/Dockerfile.twig
   :linenos:

docker-compose.yaml.twig
========================

.. code-block:: twig
   :include: code/docker-compose.yaml.twig
   :linenos:

justfile.twig
=============

.. code-block:: twig
   :include: code/justfile.twig
   :linenos:
