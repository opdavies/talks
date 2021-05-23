.. page:: titlePage

.. class:: centredtitle

Roles: configuring a LAMP stack

.. page:: standardPage

requirements.yml
================

.. code-block:: yaml

    ---
    - src: geerlingguy.apache
    - src: geerlingguy.composer
    - src: geerlingguy.mysql
    - src: geerlingguy.php
    - src: geerlingguy.php-mysql

.. raw:: pdf

  TextAnnotation "Requirements file for Ansible roles"
  TextAnnotation "Typically requirements.yml"
  TextAnnotation "Pulled from Ansible Galaxy"
  TextAnnotation "Equivilent to composer.json/Packagist in PHP"

.. page:: titlePage

.. class:: centredtitle

``ansible-galaxy install
-r requirements.yml``

.. page:: standardPage

.. code-block:: yaml

    # playbook.yml

    ---
    - hosts: webservers

      roles:
        - geerlingguy.apache
        - geerlingguy.mysql
        - geerlingguy.php
        - geerlingguy.php-mysql
        - geerlingguy.composer

.. raw:: pdf

  TextAnnotation "How do we use them?"
  TextAnnotation "Add them to the playbook under 'roles'."
  TextAnnotation "Ordering matters here!"
  TextAnnotation "If these were ordered alphabetically then Composer install would fail because it would run before PHP is installed."

.. page::

.. code-block:: yaml

    # playbook.yml

    ---
    vars:
      apache_vhosts:
        - servername: dransible
          documentroot: /app/web

.. raw:: pdf

  TextAnnotation "configuring the Apache role to install virtual hosts."

.. page::

.. code-block:: yaml

  # playbook.yml

  ---
  vars:
    php_version: 7.4
    php_packages_extra:
      - libapache2-mod-php{{ php_version }}
      - libpcre3-dev

.. raw:: pdf

  TextAnnotation "configuring PHP."

.. page::

.. code-block:: yaml

  # playbook.yml

  ---
  vars:
    mysql_databases:
      - name: main

    mysql_users:
      - name: user
        password: secret
        priv: main.*:ALL

.. raw:: pdf

  TextAnnotation "configuring MySQL databases and users."

.. page:: titlePage

.. class:: centredtitle

``ansible-playbook provision.yml
-i hosts.yml``

.. page:: standardPage

.. code-block::

  PLAY [Provision the webserver machines] ********************************************************************************

  TASK [Gathering Facts] *************************************************************************************************
  ok: [webservers]

  TASK [geerlingguy.apache : Include OS-specific variables.] *************************************************************
  ok: [webservers]

  TASK [geerlingguy.apache : Include variables for Amazon Linux.]
  skipping: [webservers]

  TASK [geerlingguy.apache : Define apache_packages.] ********************************************************************
  ok: [webservers]

  TASK [geerlingguy.apache : include_tasks] ******************************************************************************
  included: /Users/opdavies/.ansible/roles/geerlingguy.apache/tasks/setup-Debian.yml for webservers

  TASK [geerlingguy.apache : Update apt cache.] **************************************************************************
  changed: [webservers]

.. page::

.. code-block::

  TASK [geerlingguy.composer : Ensure composer directory exists.] ********************************************************
  ok: [webservers]

  TASK [geerlingguy.composer : include_tasks] ****************************************************************************
  skipping: [webservers]

  TASK [geerlingguy.composer : include_tasks] ****************************************************************************
  skipping: [webservers]

  RUNNING HANDLER [geerlingguy.apache : restart apache] ******************************************************************
  changed: [webservers]

  RUNNING HANDLER [geerlingguy.mysql : restart mysql] ********************************************************************
  changed: [webservers]

  RUNNING HANDLER [geerlingguy.php : restart webserver] ******************************************************************
  changed: [webservers]

  RUNNING HANDLER [geerlingguy.php : restart php-fpm] ********************************************************************
  skipping: [webservers]

  PLAY RECAP *************************************************************************************************************
  webservers                 : ok=111  changed=32   unreachable=0    failed=0    skipped=78   rescued=0    ignored=0

.. page::

.. image:: images/after-provision-1.png
  :width: 24cm

.. raw:: pdf

  TextAnnotation "IP address of server, Apache is installed and running."

.. page::

.. image:: images/after-provision-2.png
  :width: 24cm

.. raw:: pdf

  TextAnnotation "No application code on the server yet."

