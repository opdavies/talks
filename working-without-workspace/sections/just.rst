.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

just

.. raw:: pdf

   TextAnnotation "Who's used a Makefile? I have, but wasn't using a lot of the build features it has. I was using it as a task runner."

.. raw:: pdf

   PageBreak standardPage

justfile
========

.. code-block:: make

   default:
     @just --list

   _exec +args:
     docker compose exec {{ args }}

   # Run Composer
   composer *args:
     just _exec php composer {{ args }}

   # Run Drush commands
   drush *args:
     just _exec php drush {{ args }}

   # Install Drupal
   install *args:
     just drush site:install -y {{ args }}

   # Run Artisan commands (Laravel)
   artisan *args:
     docker compose run \
       --entrypoint php \
       --rm \
       --tty \
       php artisan {{ args }}

.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

``just composer require
drupal/override_node_options``

.. raw:: pdf

   PageBreak

.. class:: centredtitle

``just drush cache-rebuild``

|

.. class:: centredtitle

``just install localgov``
