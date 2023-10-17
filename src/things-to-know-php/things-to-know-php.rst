.. footer:: @opdavies

Things to know about PHP
########################

|

.. class:: titleslideinfo text-white

Oliver Davies (@opdavies)

|

.. class:: centred

https://oliverdavies.uk/things-about-php

.. raw:: pdf

   TextAnnotation "Contains some code but isn't a walkthrough of the PHP manual."
   TextAnnotation ""
   TextAnnotation "For new PHPers this should give you an introduction to PHP and its tooling and community."

.. raw:: pdf

   PageBreak imagePage

.. image:: images/php-logo.png
   :width: 15cm

.. raw:: pdf

   TextAnnotation "Working with PHP and Drupal since 2007 as a hobbyist and Freelancer, full-time since 2010."
   TextAnnotation ""
   TextAnnotation "Currently working as a Lead Developer at Transport for Wales."

.. Change to a standard page.
.. raw:: pdf

   PageBreak standardPage

elePHPants!
===========

.. image:: images/elephpants.jpg
   :width: 22cm

What is PHP?
============

PHP is a popular general-purpose scripting language that is especially suited to web development.

|

Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.

|

http://php.net

.. raw:: pdf

    TextAnnotation "First released in 2005, most recent release (8.1.3) on 17th February 2022."

.. Change to a title page.
.. raw:: pdf

   PageBreak titlePage

.. class:: centredTitle

Personal Home Page

.. raw:: pdf

    PageBreak

.. class:: centredTitle

PHP: Hypertext Preprocessor

|

.. class:: centred

(recursive acronym)

.. raw:: pdf

   PageBreak imagePage

.. image:: images/php-versions.png
   :width: 24cm

.. raw:: pdf

   TextAnnotation "These are the currently supported PHP versions."

.. image:: images/server-side-languages.png
   :width: 22cm

.. raw:: pdf

   TextAnnotation "A lot of projects use PHP!"

   PageBreak

.. image:: images/content-management-systems.png
   :width: 22cm

.. raw:: pdf

   PageBreak titlePage

.. class:: centredTitle

How do I get started?

.. raw:: pdf

    PageBreak titlePage

.. raw:: pdf

    PageBreak

.. class:: centredTitle

``php -v``

.. raw:: pdf

   TextAnnotation "How do I know if I have PHP installed and what version?"

.. raw:: pdf

    PageBreak

``PHP 8.1.12 (cli) (built: Oct 25 2022 17:30:00) (ZTS)
Copyright (c) The PHP Group
Zend Engine v4.1.12, Copyright (c) Zend Technologies``

.. raw:: pdf

    PageBreak

.. class:: centredTitle

``vim index.php``

.. raw:: pdf

   TextAnnotation "Create a new file called 'index.php' in the text editor of your choice."

.. raw:: pdf

    PageBreak standardPage

Your first PHP file
===================

.. code-block:: php
   :linenos:

   <?php

   // index.php

.. raw:: pdf

   TextAnnotation "Add an opening tag (closing tag is optional, and in some cases should not be used)."
   
Your first PHP file
===================

.. code-block:: php
   :linenos:

   <?php

   // index.php

   echo 'Hello PHP Stoke';

.. raw:: pdf

    PageBreak titlePage

.. class:: centredTitle

``php index.php``

.. raw:: pdf

   TextAnnotation "Run a CLI script."

.. raw:: pdf

    PageBreak

.. class:: centredTitle

``php -S localhost:8000``

.. raw:: pdf

    PageBreak titlePage

``/app # php -S localhost:8000``

``[Thu Jan 12 15:39:41 2023] PHP 8.1.12 Development Server
http://localhost:8000) started``

.. raw:: pdf

   TextAnnotation "PHP's local development web server. Fine for simple scripts or apps."

   PageBreak imagePage

.. image:: images/hello-world.png
   :width: 22cm

.. raw:: pdf

    PageBreak titlePage

.. class:: centredTitle

``docker run --rm
-v $PWD:/app
-w /app
php:8.1-cli-alpine
php index.php``

.. raw:: pdf

   TextAnnotation "If you don't like installing things locally, you can use the official Docker images."
   TextAnnotation ""
   TextAnnotation "Not a Docker talk..."

.. raw:: pdf

    PageBreak

.. class:: centredTitle

``docker run --rm
-v $PWD:/app
-w /app
php:7.4-cli-alpine
php index.php``

.. raw:: pdf

    TextAnnotation "7.4 instead of 8.1"

.. raw:: pdf

    PageBreak

.. class:: centredTitle

``docker run --rm
-v $PWD:/var/www/html
-p 80:80
php:8.1-apache``

.. raw:: pdf

    TextAnnotation "Apache rather than CLI"

.. raw:: pdf

    PageBreak standardPage

.. code-block:: php
   :linenos:

   <?php

    // index.php

    function say()
    {
        echo 'Hello!';
    }

.. raw:: pdf

   TextAnnotation "Global function."
   TextAnnotation ""
   TextAnnotation "Simplest possible PHP script."

.. raw:: pdf

    PageBreak

.. code-block:: php
   :linenos:

   <?php

    // index.php

    function say($value)
    {
        echo $value;
    }


.. raw:: pdf

   TextAnnotation "Variable interpolation."
   TextAnnotation ""
   TextAnnotation "Variable could be any number of things."

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:

   <?php

    // index.php

    function say(string $value): void
    {
        echo $value;
    }

.. raw:: pdf

   TextAnnotation "In PHP 7, we can declare type hints on scalar values (e.g. string). Arrays and classes were possible in previous versions."
   TextAnnotation ""
   TextAnnotation "We can also declare a return type. In this case, there is nothing returned, so the return type is `void`."
   TextAnnotation ""
   TextAnnotation "Some Developers and teams prefer the minimal approach, some prefer the stricter approach."

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:

   <?php

    // index.php

    function say(string $value): string
    {
        return $value;
    }

.. raw:: pdf

   TextAnnotation "Return a string rather than echoing a string."

.. raw:: pdf

   PageBreak titlePage

.. class:: centredTitle

``declare(strict_types=1);``

.. raw:: pdf

   TextAnnotation "Enables strict typing."
   TextAnnotation ""
   TextAnnotation "If you like types..."
   TextAnnotation ""
   TextAnnotation "Depends on your preference."

.. raw:: pdf

   PageBreak standardPage

.. code-block:: php
    :linenos:

    <?php

    // src/Person.php

    class Person
    {
        public function say(string $value): void
        {
            echo $value;
        }
    }

.. raw:: pdf

   TextAnnotation "Object orientated code."
   TextAnnotation ""
   TextAnnotation "Move it into a class called `Person`. Function now becomes a method, though behaves in exactly the same way."

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:

   <?php

   // Version 1.
   say();

.. raw:: pdf

   TextAnnotation "This is how to call a global function."

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:

   <?php

   // Version 1.
   say();

   // Version 2.
   say('something');

.. raw:: pdf

   TextAnnotation "Still calling a global function with and without arguments."
   TextAnnotation ""
   TextAnnotation "First version with no arguments."
   TextAnnotation ""
   TextAnnotation "Second version providing the text as an argument."
   PageBreak

.. code-block:: php
   :linenos:

   <?php

   // Version 1.
   say();

   // Version 2.
   say('something');

   // Version 3.
   $person = new Person();
   $person->say('something');

.. raw:: pdf

   TextAnnotation "Third version using the Person class."
   PageBreak titlePage

Levelling Up
============

Content Management Systems

.. raw:: pdf

   TextAnnotation "Move from simple pages or CLI apps, need to level up"

.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

These lists are not exhaustive

.. raw:: pdf

   TextAnnotation "Other CMSes, frameworks and tools are available. These are the ones that came to mind for me."

.. raw:: pdf

   PageBreak imagePage

.. image:: images/drupal-website.png
   :width: 24cm

.. image:: images/wordpress-website.png
   :width: 24cm

.. image:: images/joomla-website.png
   :width: 24cm

.. raw:: pdf

   TextAnnotation "The big three PHP frameworks."

.. image:: images/typo3-website.png
   :width: 24cm

.. raw:: pdf

   PageBreak titlePage

Levelling Up
============

Frameworks

.. raw:: pdf

   PageBreak imagePage

.. image:: images/symfony-website.png
   :width: 22cm

.. raw:: pdf

    PageBreak

.. image:: images/laravel-website.png
   :width: 22cm

.. raw:: pdf

    PageBreak

.. image:: images/laminas-website.png
   :width: 22cm

.. raw:: pdf

   PageBreak titlePage

But I only need a static site
=============================

Static site generators

.. raw:: pdf

   TextAnnotation "My personal website falls into this category."
   TextAnnotation ""
   TextAnnotation "Write HTML or markdown."
   TextAnnotation ""
   TextAnnotation "Use a familiar templating engine like Twig or Laravel's Blade."

.. raw:: pdf

   PageBreak imagePage

.. image:: images/sculpin-website.png
   :width: 22cm

.. raw:: pdf

   PageBreak

.. image:: images/jigsaw-website.png
   :width: 22cm

.. raw:: pdf

   PageBreak titlePage

.. class:: centredTitle

Code reuse and collaboration

.. raw:: pdf

   PageBreak imagePage

.. image:: images/projects-using-symfony.png
   :width: 22cm

.. image:: images/composer-logo.png
   :height: 10cm

.. image:: images/packagist-website.png
   :width: 22cm

.. image:: images/packagist-symfony-console.png
   :width: 22cm

.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

``composer require
symfony/console``

.. raw:: pdf

   PageBreak standardPage

.. code-block:: json

   {
       "require": {
            "symfony/console": "^4.2"
       }
   }

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:

   <?php

   require 'vendor/autoload.php';

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:

   <?php

   require 'vendor/autoload.php';

   $app = new \Symfony\Component\Console\Application();
   $app->run();

.. raw:: pdf

   PageBreak

.. code-block:: php
   :linenos:

   <?php

   require 'vendor/autoload.php';

   use Symfony\Component\Console\Application;

   $app = new Application();
   $app->run();

.. raw:: pdf

   PageBreak imagePage

.. image:: images/symfony-components.png
    :width: 22cm

.. image:: images/php-fig-website.png
    :width: 22cm

.. image:: images/php-foundation-website.png
    :width: 22cm

.. raw:: pdf

   TextAnnotation " The PHP Foundation is a collective established with the non-profit mission to support, advance, and develop the PHP language. We are a community of PHP veterans, community leaders, and technology companies that rely on PHP as a critical digital infrastructure. We collaborate to ensure PHP language long-term success and maintenance."

.. raw:: pdf

   PageBreak titlePage

.. class:: centredTitle

Tools

.. raw:: pdf

   PageBreak imagePage

.. image:: images/composer-logo.png
   :height: 10cm

.. image:: images/xdebug-website.png
   :width: 22cm

.. raw:: pdf

    TextAnnotation "Xdebug is a PHP extension that provides debugging and profiling capabilities."

.. raw:: pdf

   PageBreak

.. image:: images/xdebug-example.png
   :width: 22cm

.. raw:: pdf

   TextAnnotation "Add a breakpoint, halts execution"
   TextAnnotation ""
   TextAnnotation "Shows a stack trace and variables within scope"

.. image:: images/phpunit-website.png
   :width: 22cm

.. image:: images/pest-website.png
   :width: 22cm

.. raw:: pdf

   PageBreak standardPage

.. code-block:: php
   :linenos:

    <?php

    // PHPUnit.

    use App\Email;

    final class EmailTest extends TestCase
    {
        public function testCanBeCreatedFromValidEmailAddress(): void
        {
            $this->assertInstanceOf(
                Email::class,
                Email::fromString('user@example.com')
            );
        }
    }

.. code-block:: php
   :linenos:

    <?php

    // Pest.

    use App\Email;

    it('can be created from a valid email address', function () {
        expect(Email::fromString('user@example.com'))
            ->toBeInstanceOf(Email::class);
    });

.. raw:: pdf

   PageBreak imagePage

.. image:: images/behat-website.png
   :width: 23cm

.. raw:: pdf

   TextAnnotation "Behavior Driven Development (BDD), business-focussed, user story style"

.. raw:: pdf

   PageBreak standardPage

.. code-block:: gherkin

     Feature: ls
      In order to see the directory structure
      As a UNIX user
      I need to be able to list the current directory's contents

      Scenario: List 2 files in a directory
        Given I am in a directory "test"
        And I have a file named "foo"
        And I have a file named "bar"
        When I run "ls"
        Then I should get:
          """
          bar
          foo
          """

.. raw:: pdf

   PageBreak imagePage

.. image:: images/phpstan-website.png
   :width: 24cm

.. raw:: pdf

   PageBreak titlePage

.. class:: centredTitle

Learning

.. raw:: pdf

   PageBreak imagePage

.. image:: images/drupalise-me-website.png
   :width: 22cm

.. image:: images/symfonycasts-website.png
   :width: 22cm

.. image:: images/laracasts-website.png
   :width: 22cm

.. image:: images/codecourse-website.png
   :width: 22cm

.. image:: images/zend-certification-website.png
   :width: 22cm

.. raw:: pdf

   TextAnnotation "This leads to achieving certifications which help with personal development and career progression."
   TextAnnotation ""
   TextAnnotation "Zend offer certification on the PHP language and formerly on Zend framework (now Laminas)."

.. image:: images/acquia-certification-website.png
   :width: 22cm

.. image:: images/symfony-certification-website.png
   :width: 22cm

.. raw:: pdf

   TextAnnotation "Symfony and Twig"

.. raw:: pdf

   PageBreak titlePage

.. class:: centredTitle

The Community

.. raw:: pdf

   PageBreak imagePage

.. image:: images/php-south-west-website.png
   :width: 24cm

.. image:: images/php-uk-website.png
   :width: 24cm

.. image:: images/phpug-website.png
    :width: 24cm

.. raw:: pdf

   TextAnnotation "These events are happening all over the world, for PHP and for it's sub-communities."
   TextAnnotation ""
   TextAnnotation "PHP World, php[tek] (organised by PHP Architect), DrupalCon, SymfonyCon, Laracon, PHP UK, PHP Benelux, Sunshine PHP"

   PageBreak standardPage

Things you should know about PHP
================================

* Very easy to get started
* A large choice of tools and frameworks
* A great worldwide community
* Great learning resources
* Gain experience by contributing to open source projects

.. raw:: pdf

   TextAnnotation "CMSes, frameworks, eCommerce, APIs, static sites"
   TextAnnotation ""
   TextAnnotation "Gain experience and kudos by contributing to open source projects."
   TextAnnotation ""
   TextAnnotation "Most of these have their source code posted online with an appropriate license, hosted on GitHub or elsewhere. If you find a bug or want a feature added, you have the ability to create or fix it yourself and contribute it back to the project."

.. raw:: pdf

   PageBreak standardPage

Thanks!
=======

References:

* https://www.oliverdavies.uk/things-about-php

|

Me:

* https://www.oliverdavies.uk
* https://www.oliverdavies.uk/links
* https://www.oliverdavies.uk/daily
