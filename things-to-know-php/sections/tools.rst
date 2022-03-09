.. page:: titlePage

.. class:: centredTitle

Tools

.. page:: imagePage

.. image:: images/composer-logo.png
   :height: 10cm

.. page::

.. image:: images/xdebug-website.png
   :width: 23cm

.. raw:: pdf

    TextAnnotation "Xdebug is a PHP extension that provides debugging and profiling capabilities."

.. page::

.. image:: images/xdebug-example.png
   :width: 23cm

.. raw:: pdf

   TextAnnotation "Add a breakpoint, halts execution"
   TextAnnotation "Shows a stack trace and variables within scope"

.. page::

.. image:: images/phpunit-website.png
   :width: 23cm

.. page::

.. image:: images/pest-website.png
   :width: 22cm

.. page:: standardPage

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

.. page::

.. code-block:: php
   :linenos:

    <?php

    // Pest.

    use App\Email;

    it('can be created from a valid email address', function () {
        expect(Email::fromString('user@example.com'))
            ->toBeInstanceOf(Email::class);
    });

.. page:: imagePage

.. image:: images/behat-website.png
   :width: 23cm

.. raw:: pdf

   TextAnnotation "Behavior Driven Development (BDD), business-focussed, user story style"

.. page:: standardPage

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

.. page:: imagePage

.. image:: images/phpstan-website.png
   :width: 23cm
