..
  This file used a mixture of `plain` and `php` languages for code blocks so that `hl_lines` display correctly.

.. page:: titlePage

.. class:: centredtitle

Building a blog module

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

.. raw:: pdf

    PageBreak

.. Creating the test class.

.. code-block:: php
    :include: code/2.txt
    :linenos:
    :startinline: true

.. raw:: pdf

   PageBreak

.. code-block:: php
    :include: code/2.txt
    :linenos:
    :startinline: true
    :hl_lines: 1,2,3

.. raw:: pdf

   PageBreak

.. code-block:: php
    :include: code/2.txt
    :linenos:
    :startinline: true
    :hl_lines: 5,6,7

.. raw:: pdf

   PageBreak

.. code-block:: php
    :include: code/2.txt
    :linenos:
    :startinline: true
    :hl_lines: 9,10,11

.. raw:: pdf

    PageBreak

.. Adding the first test.

.. code-block:: php
    :include: code/3.txt
    :linenos:
    :startinline: true
    :end-before: // end test

.. raw:: pdf

   PageBreak

.. code-block:: php
    :include: code/3.txt
    :linenos:
    :startinline: true
    :end-before: // end test
    :hl_lines: 3,4,8

.. raw:: pdf

   PageBreak

.. code-block:: php
    :include: code/3.txt
    :linenos:
    :startinline: true
    :end-before: // end test
    :hl_lines: 5

.. raw:: pdf

   PageBreak

.. code-block:: php
    :include: code/3.txt
    :linenos:
    :startinline: true
    :end-before: // end test
    :hl_lines: 7

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/3.txt
    :startinline: true
    :start-after: // start output
    :end-before: // end output

.. code-block:: php
    :include: code/3.txt
    :startinline: true
    :start-after: // start output
    :end-before: // end output
    :hl_lines: 1,5

.. code-block:: php
    :include: code/3.txt
    :startinline: true
    :start-after: // start output
    :end-before: // end output
    :hl_lines: 7

.. code-block:: php
    :include: code/3.txt
    :startinline: true
    :start-after: // start output
    :end-before: // end output
    :hl_lines: 8,9

.. raw:: pdf

    PageBreak

.. code-block:: yaml
    :include: code/3.txt
    :linenos:
    :start-after: // start routing
    :end-before: // end routing

.. raw:: pdf

    PageBreak

.. code-block:: yaml
    :include: code/3.txt
    :linenos:
    :start-after: // start routing
    :end-before: // end routing
    :hl_lines: 4,6

.. raw:: pdf

   TextAnnotation "This controller doesn't exist yet, but the test will tell us that."

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/3.txt
    :startinline: true
    :start-after: // start output
    :end-before: // end output
    :hl_lines: 7,8,9

.. raw:: pdf

  TextAnnotation "Same result as the module isn't enabled."

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/4.txt
    :linenos:
    :startinline: true
    :end-before: // output

|

.. code-block:: plain
    :include: code/4.txt
    :startinline: true
    :start-after: // output
    :end-before: // end output

.. raw:: pdf

   TextAnnotation "The `access content` permission isn't available."
   PageBreak

.. Enable the node module.

.. code-block:: php
    :include: code/5.txt
    :linenos:
    :startinline: true
    :end-before: // end code

|

.. code-block:: plain
    :include: code/5.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

   TextAnnotation "The error has changed. This is good."
   TextAnnotation "The controller we specified doesn't exist."
   PageBreak

.. Create the Controller.

.. code-block:: php
    :include: code/6.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code

.. raw:: pdf

   PageBreak

.. code-block:: php
    :include: code/6.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 1,2,3

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/6.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 7,13

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/6.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 9,10,11

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/6.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/7.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test

.. raw:: pdf

   TextAnnotation "Adding more assertions."
   PageBreak

.. code-block:: php
    :include: code/7.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 5,6

.. raw:: pdf

   TextAnnotation "Refactor the original assertion."
   PageBreak

.. code-block:: php
    :include: code/7.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 8,9

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/7.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/7.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 3,7

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/7.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 10,11,12

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/7.txt
    :start-after: // start output2
    :end-before: // end output2

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/8.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/8.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 1,2,3,4,5,6,7,15

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/8.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 9,10,14

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/8.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 11

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/8.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 13

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/8.txt
    :start-after: // start output
    :end-before: // end output

.. code-block:: php
    :include: code/8.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/9.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code

|

.. code-block:: yaml
    :include: code/9.txt
    :linenos:
    :start-after: // start services
    :end-before: // end services

.. raw:: pdf

    PageBreak

.. code-block:: yaml
    :include: code/9.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/10.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 5,6,7

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/10.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/11.txt
    :linenos:
    :startinline: true
    :start-after: // start code 1
    :end-before: // end code 1

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/11.txt
    :linenos:
    :startinline: true
    :start-after: // start code 1
    :end-before: // end code 1
    :hl_lines: 10,11,12

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/11.txt
    :linenos:
    :startinline: true
    :start-after: // start code 1
    :end-before: // end code 1
    :hl_lines: 8,13

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/11.txt
    :linenos:
    :startinline: true
    :start-after: // start code 2
    :end-before: // end code 2
    :hl_lines: 1,3

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/11.txt
    :linenos:
    :startinline: true
    :start-after: // start code 2
    :end-before: // end code 2
    :hl_lines: 2

.. raw:: pdf

    PageBreak

.. code-block:: yaml
    :include: code/12.txt
    :linenos:
    :start-after: // start services1
    :end-before: // end services1

|

.. code-block:: yaml
    :include: code/12.txt
    :linenos:
    :start-after: // start services2
    :end-before: // end services2

.. raw:: pdf

   TextAnnotation "Declare the Repository as a service."
   TextAnnotation "Autowire or declare dependencies explicitly."

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/12.txt
    :start-after: // start output
    :end-before: // end output

|

.. code-block:: php
    :include: code/13.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/13.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/14.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 1

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/14.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 5

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/14.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/15.txt
    :linenos:
    :start-after: // start test
    :end-before: // end test
    :startinline: true

.. raw:: pdf

   TextAnnotation "We know we're getting a node, but are we getting the correct node?"
   PageBreak

.. code-block:: php
    :include: code/15.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 1,2,3,4

.. raw:: pdf

   TextAnnotation "Create a node with a specific title."
   PageBreak

.. code-block:: php
    :include: code/15.txt
    :linenos:
    :startinline: true
    :end-before: // end test
    :start-after: // start test
    :hl_lines: 10,11

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/15.txt
    :startinline: true
    :linenos:
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 13,14,15

.. raw:: pdf

     TextAnnotation "Ensure the node is an article and has the correct title."
     PageBreak

.. Published or unpublished nodes.

.. code-block:: php
    :include: code/16.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/16.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 2,4,6

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/16.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 3,5

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/16.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 12

.. raw:: pdf

   TextAnnotation "We should only have three published articles."
   PageBreak

.. code-block:: plain
    :include: code/16.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/17.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code

|

.. code-block:: plain
    :include: code/17.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. Ensure articles are ordered correctly.

.. code-block:: php
    :include: code/18.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/18.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 3,5,7,9,11

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/18.txt
    :linenos:
    :startinline: true
    :start-after: // start test
    :end-before: // end test
    :hl_lines: 16

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/18.txt
    :start-after: // start output
    :end-before: // end output

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/19.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/19.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 2,3,4

.. raw:: pdf

    PageBreak

.. code-block:: php
    :include: code/19.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 6,7

.. raw:: pdf

   TextAnnotation "Spaceship operator!"
   PageBreak

.. code-block:: php
    :include: code/19.txt
    :linenos:
    :startinline: true
    :start-after: // start code
    :end-before: // end code
    :hl_lines: 9

.. raw:: pdf

    PageBreak

.. code-block:: plain
    :include: code/19.txt
    :start-after: // start output
    :end-before: // end output
