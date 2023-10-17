.. page:: titlePage

.. class:: centredtitle

Demo: Building a blog module

.. raw:: pdf

   TextAnnotation "Shortened and simplified example."
   TextAnnotation "I'd use Views for this in a real situation."

.. page:: standardPage

Acceptance criteria
===================

- As a site visitor
- I want to see a list of published articles at ``/blog``
- Ordered by post date, most recent first

Tasks
=====

- Ensure the blog page exists
- Ensure only published articles are shown
- Ensure the articles are shown in the correct order

.. page::

.. Creating the test class.

.. code-block:: php
  :include: code/2.txt
  :linenos:
  :startinline: true

.. page::

.. Adding the first test.

.. code-block:: php
  :end-before: // end test
  :include: code/3.txt
  :linenos:
  :startinline: true
  
.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/3.txt
  :start-after: // start output
  :startinline: true

.. page::

.. code-block:: yaml
  :end-before: // end routing
  :include: code/3.txt
  :linenos:
  :start-after: // start routing

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/3.txt
  :start-after: // start output
  :startinline: true

.. raw:: pdf

  TextAnnotation "Same result as the module isn't enabled."

.. page::

.. code-block:: php
  :include: code/4.txt
  :end-before: // output
  :linenos:
  :startinline: true

|

.. code-block:: plain
  :include: code/4.txt
  :end-before: // end output
  :start-after: // output
  :startinline: true

.. page::

.. Enable the node module.

.. code-block:: php
  :include: code/5.txt
  :linenos:
  :end-before: // end code
  :startinline: true

|

.. code-block:: php
  :include: code/5.txt
  :end-before: // end output
  :start-after: // start output

.. page::

.. Create the Controller.

.. code-block:: php
  :end-before: // end code
  :include: code/6.txt
  :linenos:
  :startinline: true
  :start-after: // start code

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/6.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end test
  :include: code/7.txt
  :linenos:
  :startinline: true
  :start-after: // start test

.. raw:: pdf

   TextAnnotation "Adding extra assertions."

.. page::

.. code-block:: php
  :end-before: // end code
  :include: code/7.txt
  :linenos:
  :startinline: true
  :start-after: // start code

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/7.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end code
  :include: code/8.txt
  :linenos:
  :start-after: // start code
  :startinline: true


.. code-block:: php
  :end-before: // end output
  :include: code/8.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end code
  :include: code/9.txt
  :linenos:
  :start-after: // start code
  :startinline: true

|

.. code-block:: yaml
  :end-before: // end services
  :include: code/9.txt
  :linenos:
  :start-after: // start services

.. page::

.. code-block:: yaml
  :end-before: // end output
  :include: code/9.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end code
  :include: code/10.txt
  :linenos:
  :start-after: // start code
  :startinline: true

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/10.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end code
  :include: code/11.txt
  :linenos:
  :startinline: true
  :start-after: // start code

.. code-block:: yaml
  :end-before: // end services
  :include: code/12.txt
  :linenos:
  :start-after: // start services

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/12.txt
  :start-after: // start output

|

.. code-block:: php
  :end-before: // end test
  :include: code/13.txt
  :linenos:
  :start-after: // start test
  :startinline: true

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/13.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end test
  :include: code/14.txt
  :linenos:
  :start-after: // start test
  :startinline: true

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/14.txt
  :start-after: // start output

.. page::


.. code-block:: php
  :end-before: // end test
  :include: code/15.txt
  :linenos:
  :start-after: // start test
  :startinline: true

.. page::

.. code-block:: php
  :end-before: // end test
  :include: code/16.txt
  :linenos:
  :start-after: // start test
  :startinline: true

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/16.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end code
  :include: code/17.txt
  :linenos:
  :start-after: // start code
  :startinline: true

|

.. code-block:: plain
  :end-before: // end output
  :include: code/17.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end test
  :include: code/18.txt
  :linenos:
  :start-after: // start test
  :startinline: true

.. page::

.. code-block:: plain
  :end-before: // end output
  :include: code/18.txt
  :start-after: // start output

.. page::

.. code-block:: php
  :end-before: // end code
  :include: code/19.txt
  :linenos:
  :start-after: // start code
  :startinline: true

|

.. code-block:: plain
  :end-before: // end output
  :include: code/19.txt
  :start-after: // start output

