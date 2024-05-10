.. raw:: pdf

   PageBreak standardPage

What is "Build Configs"?
========================

- Command-line tool.
- Inspired by Workspace, name from the TheAltF4Stream.
- Built with Symfony.
- Creates and manages build configuration files.
- Customisable per-project.
- Drupal, PHP library, Fractal (TypeScript).
- "Sprint zero in a box".

What Problem Does it Solve?
===========================

- I work on multiple similar projects.
- Different configuration values - e.g. ``web`` vs. ``docroot``.
- Different versions of PHP, node, etc.
- Different Docker Compose (``fpm`` vs. ``apache`` images).
- Each project was separate.
- Difficult to add new features and fix bugs across all projects.
- Inconsistencies across projects.
- Out of the box solutions didn't seem like the best fit.

.. raw:: pdf

    TextAnnotation "Multiple projects with similar but different configurations."
    TextAnnotation ""
    TextAnnotation "Out of the box solutions tend to focus on one technology, could be hard to customise, and usually had more than I nedeed."
    TextAnnotation ""
    TextAnnotation "Start small and build up instead of removing additional things."
    TextAnnotation ""
    TextAnnotation "More opportunities to learn the underlying technologies."

How Does it Work?
=================

.. image:: diagram.png
    :width: 18cm

.. raw:: pdf

   TextAnnotation "Canonical templates and project-specific configuration goes in, templates come out."

What Files Does it Generate?
============================

- Dockerfile, Docker Compose, Nix Flake, php.ini, NGINX default.conf.
- ``run`` file.
- PHPUnit, PHPCS, PHPStan.
- GitHub Actions workflow.
- Git hooks.
