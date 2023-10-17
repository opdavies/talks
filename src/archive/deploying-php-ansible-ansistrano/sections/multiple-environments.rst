.. page:: titlePage

.. class:: centredtitle

Multiple environments development, test, production

.. page:: standardPage

.. code-block:: yaml

  # vars.yml

  ---
  vars:
    mysql_databases:
      - name: production
      - name: staging

    mysql_users:
      - name: production
        password: '{{ live_db_password }}'
        priv: '{{ live_db_name }}.*:ALL'

      - name: staging
        password: '{{ staging_db_password }}'
        priv: staging.*:ALL

.. page::

.. code-block:: yaml

  # hosts.yml

  ---
  production:
    children:
      hosts:
        webservers:
          ansible_ssh_host: 192.168.33.10
          ansible_ssh_port: 22

          project_deploy_path: /app
          git_branch: production

          drupal_hash_salt: '{{ vault_drupal_hash_salt }}'
          drupal_install: false

          drupal_settings:
            # ...

.. page::

.. code-block:: yaml

  # hosts.yml

  ---
  staging:
    children:
      hosts:
        webservers:
          ansible_ssh_host: 192.168.33.10
          ansible_ssh_port: 22

          project_deploy_path: /app-staging
          git_branch: staging

          drupal_hash_salt: '{{ vault_drupal_hash_salt }}'
          drupal_install: true

          drupal_settings:
            # ...

.. page:: titlePage

.. class:: centredtitle

``ansible-playbook deploy.yml
-i hosts.yml
--limit staging``

.. page::

.. class:: centredtitle

``ansible-playbook deploy.yml
-i hosts.yml
--limit production``

