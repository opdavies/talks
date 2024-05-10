.. page:: titlePage

.. class:: centredtitle

Keeping secrets with Ansible Vault

.. page:: standardPage

.. code-block:: yaml

  ---
  vars:
    mysql_databases:
      - name: main

    mysql_users:
      - name: user
        password: secret
        priv: main.*:ALL

.. raw:: pdf

    PageBreak

.. code-block:: yaml

  # provision_vault.yml

  ---
  vault_database_name: main
  vault_database_user: user
  vault_database_password: secret

.. page:: titlePage

.. class:: centredtitle

``ansible-vault encrypt
provision_vault.yml``

.. class:: centredtitle

``New Vault password: 
Confirm New Vault password: 
Encryption successful``

.. page:: standardPage

.. code-block::

  $ANSIBLE_VAULT;1.1;AES256
  63656632326165643137646334343537396533656565313032363262623962393861666438393539
  6366336638316133373061306332303761383565343035330a373637373830356430353630356161
  32313831663039343733343539636365386333303862363635323138346137666166356639323338
  3264636538356634390a343766353661386666376362376439386630363664616166643364366335
  62373530393933373830306338386539626565313364643133666131613138383431353638636334
  39376437633462373934313236363662633832643138386433646230313465383337373031373137
  61353963623364393134386335373731356337366464633531656435383161656435313530363234
  37373865393839616534353165656463313961333532363537383263343364646534333032336337
  3235

.. raw:: pdf

    PageBreak

.. code-block:: yaml

  # provision_vars.yml

  ---
  database_name: '{{ vault_database_name }}'
  database_user: '{{ vault_database_user }}'
  database_password: '{{ vault_database_password }}'

.. raw:: pdf

    PageBreak


.. code-block:: yaml

  # provision.yml

  ---
  vars_files:
    - vars/provision_vault.yml
    - vars/provision_vars.yml

  vars:
    mysql_databases:
      - '{{ database_name }}'

    mysql_users:
      - name: '{{ database_user }}'
        password: '{{ database_password }}'
        priv: '{{ database_name }}.*:ALL'

.. page:: titlePage

.. class:: centredtitle

``ansible-playbook deploy.yml
-i hosts.yml
--ask-vault-pass``

.. page:: 
.. class:: centredtitle

``ansible-playbook deploy.yml
-i hosts.yml
--vault-password-file secret.txt``

