.. page:: titlePage

.. class:: centredtitle

Better deployments with Ansistrano

.. page:: standardPage

.. image:: images/ansistrano.png
  :width: 24cm

.. page::

Features
========

- Multiple release directories
- Shared paths and files
- Customisable
- Multiple deployment strategies
- Multi-stage environments
- Prune old releases
- Rollbacks

.. page::


.. code-block:: yaml

  # requirements.yml

  ---
  - src: ansistrano.deploy
  - src: ansistrano.rollback

.. raw:: pdf

  TextAnnotation "to install Ansistrano, add the additional roles to the requirements.yml file"

.. page::


.. code-block:: yaml

  # deploy.yml

  ---
  - hosts: all

    roles:
      - ansistrano.deploy

.. raw:: pdf

  TextAnnotation "add to roles within the playbook"

.. page::

.. code-block:: yaml

  # deploy.yml

  ---
  vars:
    project_deploy_dir: /app

    ansistrano_deploy_to: '{{ project_deploy_dir }}'
    ansistrano_deploy_via: git
    ansistrano_git_branch: master
    ansistrano_git_repo: 'git@github.com:opdavies/dransible'

.. page::
.. code-block::

  PLAY [webservers] ******************************************************************************************************

  TASK [Gathering Facts] *************************************************************************************************
  ok: [webservers]

  TASK [ansistrano.deploy : include_tasks] *******************************************************************************

  TASK [ansistrano.deploy : include_tasks] *******************************************************************************
  included: /Users/opdavies/.ansible/roles/ansistrano.deploy/tasks/setup.yml for webservers

  TASK [ansistrano.deploy : ANSISTRANO | Ensure deployment base path exists] *********************************************
  ok: [webservers]

  TASK [ansistrano.deploy : ANSISTRANO | Ensure releases folder exists] **************************************************
  ok: [webservers]

  TASK [ansistrano.deploy : ANSISTRANO | Ensure shared elements folder exists] *******************************************
  ok: [webservers]

  TASK [ansistrano.deploy : ANSISTRANO | Ensure shared paths exists] *****************************************************
  ok: [webservers] => (item=web/sites/default/files)

.. page::

.. code-block::

  TASK [ansistrano.deploy : Update file permissions] *********************************************************************
  changed: [webservers]

  TASK [ansistrano.deploy : include_tasks] *******************************************************************************

  TASK [ansistrano.deploy : include_tasks] *******************************************************************************
  included: /Users/opdavies/.ansible/roles/ansistrano.deploy/tasks/cleanup.yml for webservers

  TASK [ansistrano.deploy : ANSISTRANO | Clean up releases] **************************************************************
  changed: [webservers]

  TASK [ansistrano.deploy : include_tasks] *******************************************************************************

  TASK [ansistrano.deploy : include_tasks] *******************************************************************************
  included: /Users/opdavies/.ansible/roles/ansistrano.deploy/tasks/anon-stats.yml for webservers

  TASK [ansistrano.deploy : ANSISTRANO | Send anonymous stats] ***********************************************************
  skipping: [webservers]

  PLAY RECAP *************************************************************************************************************
  webservers                 : ok=33   changed=14   unreachable=0    failed=0    skipped=7    rescued=0    ignored=0

.. page::

.. code-block::

  vagrant@dransible:/app$ ls -l
  total 8

  lrwxrwxrwx 1   26 Jul 19 00:15 current -> ./releases/20190719001241Z
  drwxr-xr-x 5 4096 Jul 22 20:30 releases
  drwxr-xr-x 4 4096 Jul 19 00:00 shared

.. page::

.. code-block::

  vagrant@dransible:/app/releases$ ls -l
  total 20

  drwxr-xr-x  5 4096 Jul 22 20:30 .
  drwxr-xr-x  4 4096 Jul 19 00:15 ..
  drwxr-xr-x 10 4096 Jul 19 00:02 20190719000013Z
  drwxr-xr-x 10 4096 Jul 19 00:14 20190719001241Z
  drwxr-xr-x  9 4096 Jul 22 20:30 20190722203038Z

.. page::


.. code-block:: yaml

  # rollback.yml

  ---
  - hosts: all

    roles:
      - ansistrano.rollback

    vars:
      ansistrano_deploy_to: '{{ project_deploy_dir }}'

.. page:: titlePage

.. class:: centredtitle

``ansible-playbook rollback.yml
-i hosts.yml``

.. page::

.. class:: centredtitle

Customising Ansistrano:
Build Hooks

.. page:: imagePage

.. image:: images/ansistrano-flow.png
  :width: 18cm

.. raw:: pdf

  TextAnnotation "Each step has a 'before' and 'after' step Ansistrano allows us to add more things by providing a path to a playbook and adding additional steps."

.. page:: standardPage

.. code-block:: yaml

  # deploy.yml

  ---
  vars:
    ansistrano_after_symlink_shared_tasks_file: >
      '{{ playbook_dir }}/deploy/after-symlink-shared.yml'
    ansistrano_after_symlink_tasks_file: >
      '{{ playbook_dir }}/deploy/after-symlink.yml'
    ansistrano_after_update_code_tasks_file: >
      '{{ playbook_dir }}/deploy/after-update-code.yml'

    release_web_path: '{{ ansistrano_release_path.stdout }}/web'
    release_drush_path: '{{ ansistrano_release_path.stdout }}/bin/drush'

.. page::


.. code-block:: yaml

  # deploy/after-update-code.yml

  ---
  - name: Install Composer dependencies
    composer:
      command: install
      working_dir: '{{ ansistrano_release_path.stdout }}'

.. page::


.. code-block:: yaml
  
  # deploy/after-symlink-shared.yml

  ---
  - name: Run database updates
    command: >
      {{ release_drush_path }}
      --root {{ release_web_path }}
      updatedb

.. page::

.. code-block:: yaml

  # deploy/after-symlink.yml

  ---
  - name: Rebuild Drupal cache
    command: >
      {{ release_drush_path }}
      --root {{ release_web_path }}
      cache-rebuild

