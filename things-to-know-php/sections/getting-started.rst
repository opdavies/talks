.. page:: titlePage

.. class:: centredTitle

How do I get started?

.. page::

.. class:: centredTitle

``php -v``

.. page::

``PHP 8.1.0 (cli) (built: Nov 30 2021 07:15:23) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.0, Copyright (c) Zend Technologies``

.. page::

.. class:: centredTitle

``vim index.php``

.. raw:: pdf

   TextAnnotation "Create a new file called 'index.php' in the text editor of your choice."

.. page:: standardPage

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

   echo 'Hello World';

.. page:: titlePage

.. class:: centredTitle

``php index.php``

.. page::

.. class:: centredTitle

``php -S localhost:8000``

.. page:: titlePage

``/app # php -S localhost:8000``

``[Tue Mar  8 20:52:39 2022] PHP 8.1.0 Development Server
(http://localhost:8000) started``

.. raw:: pdf

   TextAnnotation "PHP's local development web server. Fine for simple scripts or apps."

.. page:: imagePage

.. image:: images/hello-world.png
   :width: 23cm

.. page:: titlePage

.. class:: centredTitle

``docker run --rm
-v $PWD:/app
-w /app
php:8.1-cli-alpine
php index.php``

.. page::

.. class:: centredTitle

``docker run --rm
-v $PWD:/app
-w /app
php:7.4-cli-alpine
php index.php``

.. raw:: pdf

    TextAnnotation "7.4 instead of 8.1"

.. page::

.. class:: centredTitle

``docker run --rm
-v $PWD:/var/www/html
-p 80:80
php:8.1-apache``

.. raw:: pdf

    TextAnnotation "Apache rather than CLI"

.. page:: standardPage

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

.. page::

.. code-block:: php
   :linenos:

   <?php

    // index.php

    function say($value)
    {
        echo $value;
    }

.. page::

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
   TextAnnotation "We can also declare a return type. In this case, there is nothing returned, so the return type is `void`."

.. page::

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

.. page::

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

   TextAnnotation "Move it into a class called `Person`. Function now becomes a method, though behaves in exactly the same way."

.. page::

.. code-block:: php
   :linenos:

   <?php

   // Version 1.
   say();

.. page::

.. code-block:: php
   :linenos:

   <?php

   // Version 1.
   say();

   // Version 2.
   say('something');

.. raw:: pdf

   TextAnnotation "First version with no arguments."
   TextAnnotation "Second version providing the text as an argument."
   TextAnnotation "Third version using the Person class."

.. page::

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
