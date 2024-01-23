Example
=======

build.yaml:

.. code-block:: yaml

   name: my-example-project
   type: drupal
   language: php

   php:
     version: 8.1-fpm-bullseye

|

Dockerfile:

.. raw:: pdf

   TextAnnotation "Abstract the project-specific values and configuration into this file."

.. code-block:: yaml

   FROM php:8.1-fpm-bullseye AS base

Configuring a Project
=====================

.. code-block:: yaml

   php:
     version: 8.1-fpm-bullseye

     # Which PHPCS standards should be used and on which paths?
     phpcs:
       paths: [web/modules/custom]
       standards: [Drupal, DrupalPractice]

     # What level should PHPStan run and on what paths?
     phpstan:
       level: max
       paths: [web/modules/custom]

.. raw:: pdf

   PageBreak

.. code-block:: yaml

   docker-compose:
     # Which Docker Compose services do we need?
     services:
       - database
       - php
       - web

   dockerfile:
     stages:
       build:
         # What commands do we need to run?
         commands:
           - composer validate --strict
           - composer install

.. raw:: pdf

   PageBreak

.. code-block:: yaml

   web:
     type: nginx # nginx, apache, caddy

   database:
     type: mariadb # mariadb, mysql
     version: 10

   # Where is Drupal located?
   drupal:
     docroot: web # web, docroot, null

   experimental:
     createGitHubActionsConfiguration: true
     runGitHooksBeforePush: true
     useNewDatabaseCredentials: true

.. raw:: pdf

  TextAnnotation "Experimental opt-in features that I want to trial on certain projects or to disable non-applicable features - e.g. GitHub Actions on Bitbucket."

  PageBreak
