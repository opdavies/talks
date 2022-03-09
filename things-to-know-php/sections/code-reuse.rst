.. page:: titlePage

.. class:: centredTitle

Code reuse and collaboration

.. page:: standardPage

.. image:: images/projects-using-symfony.png
   :width: 23cm

.. page::

.. image:: images/composer-logo.png
   :height: 10cm

.. page::

.. image:: images/packagist-website.png

.. page::

.. image:: images/packagist-symfony-console.png

.. page:: titlePage

.. class:: centredtitle

``composer require
symfony/console``

.. page::

.. code-block:: json

   {
       "require": {
            "symfony/console": "^4.2"
       }
   }


.. page:: standardPage

.. code-block:: php
   :linenos:

   <?php

   require 'vendor/autoload.php';

.. page::

.. code-block:: php
   :linenos:

   <?php

   require 'vendor/autoload.php';

   $app = new \Symfony\Component\Console\Application();
   $app->run();

.. page::

.. code-block:: php
   :linenos:

   <?php

   require 'vendor/autoload.php';

   use Symfony\Component\Console\Application;

   $app = new Application();
   $app->run();

.. page:: imagePage

.. image:: images/symfony-components.png
    :width: 23cm

.. page::

.. image:: images/php-fig-website.png
    :width: 23cm
