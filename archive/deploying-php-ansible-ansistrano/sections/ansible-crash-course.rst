.. page:: titlePage

.. class:: centredtitle

Hosts / Inventories

.. page:: standardPage

hosts.ini
=========

.. code:: ini

    [webservers]
    192.168.33.10

    [webservers:vars]
    ansible_ssh_port=22
    ansible_ssh_user=opdavies

.. raw:: pdf

  TextAnnotation "Vagrant IP address."
  TextAnnotation "Supports wildcards and ranges"

hosts.yml
=========

.. code-block:: yaml

    ---
    all:
      children:
        webservers:
          hosts:
            192.168.33.10:
          vars:
            ansible_ssh_port: 22
            ansible_ssh_user: opdavies

.. raw:: pdf

  TextAnnotation "My prefered format."
  TextAnnotation "More consistency across the project, easier to copy variables from other places such as playbooks."

.. page:: titlePage

.. class:: centredtitle

Ad-hoc Commands

.. page::

.. class:: centredtitle

``ansible all -i hosts.yml
-m ping``

.. raw:: pdf

  TextAnnotation "Single ad-hoc command."
  TextAnnotation "-i = inventory"
  TextAnnotation "-m = module"

.. page:: standardPage

.. code:: json

    webservers | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python"
        },
        "changed": false,
        "ping": "pong"
    }

.. page:: titlePage

.. class:: centredtitle

``ansible all -i hosts.yml
-m command
-a "git pull --chdir=/app"``

.. raw:: pdf

  TextAnnotation "Update a codebase using "git pull""
  TextAnnotation "-a = (additional) arguments"
  TextAnnotation "--chdir = change directory"

.. page::

.. class:: centredtitle

``ansible all -i hosts.yml
-m git
-a "repo=https://github.com
/opdavies/dransible
--chdir=/app"``

.. raw:: pdf

  TextAnnotation "Same example, but using the core "Git" module"

.. page:: titlePage

.. class:: centredtitle

Playbooks

.. page:: standardPage

.. code-block:: yaml

  ---
  - hosts: webservers

    vars:
      git_repo: https://github.com/opdavies/dransible
      project_root_dir: /app

      tasks:
        - name: Update the code
          git:
            repo: '{{ git_repo }}'
            dest: '{{ project_root_dir }}'

.. raw:: pdf

  TextAnnotation "YAML file"
  TextAnnotation "Collection of multiple tasks"
  TextAnnotation "Can add and use variables"

.. page:: titlePage

.. class:: centredtitle

``ansible-playbook main.yml
-i hosts.yml``

.. raw:: pdf

  TextAnnotation "How do we run a playbook?"
  TextAnnotation "Use the ansible-playbook command and specify the name of the playbook."
