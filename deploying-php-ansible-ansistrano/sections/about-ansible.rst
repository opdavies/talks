.. page:: standardPage

What is Ansible?
================

.. class:: text-lg

Ansible is an open-source **software provisioning**, **configuration management**, and **application-deployment** tool.

|

https://en.wikipedia.org/wiki/Ansible_(software)

.. page::

What is Ansible?
================

- CLI tool
- Configured with YAML
- Agentless, connects via SSH
- Jinja2 for templating
- Executes ad-hoc remote commands
- Installs software packages
- Performs deployment steps
- Batteries included


.. raw:: pdf

  TextAnnotation "- Written in Python but configured with Yaml."
  TextAnnotation "Drupal, Symfony and a lot of other projects use YAML."
  TextAnnotation "Nothing needed on the server, other than Python."
  TextAnnotation "First-party modules (SSH keys, file and directory management, package repositories, stopping/starting/restarting services, DO/Linode/AWS integration)."

.. page::

Why Ansible?
============

- Familiar syntax (Drupal 8, Symfony, Sculpin)
- Easily readable
- No server dependencies
- Easy to add to an existing project
- Includes relevant modules (Git, Composer)
- Idempotency, resulting in cleaner scripts
