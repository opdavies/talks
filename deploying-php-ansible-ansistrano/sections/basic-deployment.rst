.. page:: titlePage

.. class:: centredtitle

Basic deployment

.. page:: standardPage

.. class:: small

.. code-block:: yaml

  # deploy.yml

  ---
  tasks:
    - name: Creating project directory
      file:
        path: /app
        state: directory

    - name: Uploading application
      synchronize:
        src: '{{ playbook_dir }}/../'
        dest: /app




    - name: Installing Composer dependencies
      composer:
        command: install
        working_dir: /app

.. raw:: pdf

  TextAnnotation "Using file module to create the directory"
  TextAnnotation "Using synchronize module/rsync to upload the files"
  TextAnnotation "Using Composer module to install dependencies. There are other possible values."

.. page:: titlePage

.. class:: centredtitle

``ansible-playbook deploy.yml
-i hosts.yml``

.. page:: standardPage

.. image:: images/after-deploy-1.png
  :width: 24cm

.. page:: standardPage

Disadvantages
=============

- Sensitive data stored in plain text
- Single point of failure
- No ability to roll back

