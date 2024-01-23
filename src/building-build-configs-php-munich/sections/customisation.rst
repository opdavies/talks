.. raw:: pdf

   PageBreak standardPage

Overriding Values
=================

.. code-block:: yaml

   php:
     version: 8.1-fpm-bullseye
     # Disable PHPCS, PHPStan and PHPUnit.
     phpcs: false
     phpstan: false
     phpunit: false

   # Ignore more directories from Git.
   git:
     ignore:
       - /bin/
       - /libraries/
       - /web/profiles/contrib/

.. raw:: pdf

   TextAnnotation "Drupal Commerce Kickstart demo. No custom modules to test, and additional paths to ignore from Git."

   PageBreak

.. code-block:: yaml

   dockerfile:
     stages:
       build:
         # What additional directories do we need?
         extra_directories:
           - config
           - patches
           - scripts

         commands:
           - composer validate --strict
           - composer install

         # What additional PHP extensions do we need?
         extensions:
           install: [bcmath]

.. raw:: pdf

   TextAnnotation "Extra directories and PHP extensions that need to be added".

