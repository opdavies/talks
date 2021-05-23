.. page:: titlePage

.. class:: centredtitle

Generating settings files per deployment

.. page:: standardPage

.. code-block:: yaml

  # deploy_vars.yml
  ---
  drupal_settings:
    - drupal_root: /app/web
      sites:
        - name: default
          settings:
            databases:
              default:
                default:
                  driver: mysql
                  host: localhost
                  database: '{{ database_name }}'
                  username: '{{ database_user }}'
                  password: '{{ database_password }}'
            hash_salt: '{{ hash_salt }}'
            config_directories:
              sync: ../config/sync

.. page::

.. code-block:: jinja

    {# templates/settings.php.j2 #}

    {% for key, values in item.1.settings.databases.items() %}
    {% for target, values in values.items() %}
    $databases['{{ key }}']['{{ target }}'] = array(
      'driver' => '{{ values.driver|default('mysql') }}',
      'host' => '{{ values.host|default('localhost') }}',
      'database' => '{{ values.database }}',
      'username' => '{{ values.username }}',
      'password' => '{{ values.password }}',
    );

    {% endfor %}
    {% endfor %}

    {% if item.1.settings.base_url is defined %}
    $base_url = '{{ item.1.settings.base_url }}';
    {% endif %}

.. page::


.. code-block:: yaml

  # tasks/main.yml

  ---
  - name: Ensure directory exists
    file:
      state: directory
      path: '{{ item.0.drupal_root }}/sites/{{ item.1.name|default("default") }}'
    with_subelements:
      - '{{ drupal_settings }}'
      - sites
    no_log: true

  - name: Create settings files
    template:
      src: settings.php.j2
      dest:
        '{{ item.0.drupal_root }}/sites/{{ item.1.name|default("default") }}/{{
        item.1.filename|default("settings.php") }}'
    with_subelements:
      - '{{ drupal_settings }}'
      - sites
    no_log: true

