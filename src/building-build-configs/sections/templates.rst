.. raw:: pdf

   PageBreak standardPage

Dockerfile.twig
===============

.. code-block:: twig
    :linenos:

    FROM php:{{ php.version }} AS base

    COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
    RUN which composer && composer -V

    ARG DOCKER_UID=1000
    ENV DOCKER_UID="${DOCKER_UID}"

    WORKDIR {{ project_root }}

    RUN adduser --disabled-password --uid "${DOCKER_UID}" app \
      && chown app:app -R {{ project_root }}

Dockerfile.twig
===============

.. code-block:: twig
   :linenos:

    {% if dockerfile.stages.build.extensions.install %}
    RUN docker-php-ext-install
      {{ dockerfile.stages.build.extensions.install|join(' ') }}
    {% endif %}

    COPY --chown=app:app phpunit.xml* ./

    {% if dockerfile.stages.build.extra_files %}
    COPY --chown=app:app {{ dockerfile.stages.build.extra_files|join(" ") }} ./
    {% endif %}

    {% for directory in dockerfile.stages.build.extra_directories %}
    COPY --chown=app:app {{ directory }} {{ directory }}
    {% endfor %}

docker-compose.yaml.twig
========================

.. code-block:: twig
   :linenos:

    services:
    {% if "web" in dockerCompose.services %}
      web:
        <<: [*default-proxy, *default-app]
        build:
          context: .
          target: web
        depends_on:
          - php
        profiles: [web]
    {% endif %}

phpstan.neon.dist.twig
======================

.. code-block:: twig
   :linenos:

    parameters:
      level: {{ php.phpstan.level }}
      excludePaths:
        - *Test.php
        - *TestBase.php
      paths:
        {% for path in php.phpstan.paths -%}
        - {{ path }}
        {%- endfor %}

    {% if php.phpstan.baseline %}
    includes:
      - phpstan-baseline.neon
    {% endif %}

phpunit.xml.dist.twig
=====================

.. code-block:: twig
   :linenos:

    <phpunit
      beStrictAboutChangesToGlobalState="true"
      beStrictAboutOutputDuringTests="false"
      beStrictAboutTestsThatDoNotTestAnything="true"
      bootstrap="{{ drupal.docroot }}/core/tests/bootstrap.php"
      cacheResult="false"
      colors="true"
      failOnWarning="true"
      printerClass="\Drupal\Tests\Listeners\HtmlOutputPrinter"
    >

phpunit.xml.dist.twig
=====================

.. code-block:: twig
   :linenos:

    <testsuites>
      <testsuite name="functional">
        <directory>./{{ drupal.docroot }}/modules/custom/**/tests/**/Functional</directory>
      </testsuite>
      <testsuite name="kernel">
        <directory>./{{ drupal.docroot }}/modules/custom/**/tests/**/Kernel</directory>
      </testsuite>
      <testsuite name="unit">
        <directory>./{{ drupal.docroot }}/modules/custom/**/tests/**/Unit</directory>
      </testsuite>
    </testsuites>
