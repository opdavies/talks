.. page:: titlePage

.. class:: centredtitle

Example

.. page:: imagePage

.. image:: images/broadbean-website.png
    :width: 20cm

.. page:: standardPage

Specification
=============

* Job adverts created in Broadbean UI, create nodes in Drupal.
* Application URL links users to separate application system.
* Constructed from domain, includes role ID as a GET parameter and optionally UTM parameters.
* Jobs need to be linked to offices.
* Job length specified in number of days.
* Path is specified as a field in the API.

.. raw:: pdf

    TextAnnotation "Jobs added to a different system by the client, data POSTed to Drupal."
    TextAnnotation "Job applicants would visit the job on the Drupal site, click the application URL and go to another (CRM) system to apply."
    TextAnnotation "Client wanted to be able to specify the Drupal path in advance."

.. page:: imagePage

|
|

.. image:: images/broadbean-drupal-flow-2.png
    :width: 20cm

.. page:: standardPage

Implementation
==============

* Added route to accept data from API as XML
* Added system user with API role to authenticate
* ``active_for`` converted from number of days to UNIX timestamp
* ``branch_name`` and ``locations`` converted from plain text to entity reference (job node to office node)
* ``url_alias`` property mapped to ``path``

.. raw:: pdf

    TextAnnotation "Required field missing."
    TextAnnotation "Incorrect branch name."

Incoming data
=============

.. code-block:: php
    :include: example/incoming.txt
    :startinline: true

Incoming data
=============

.. code-block:: php
    :include: example/incoming.txt
    :hl_lines: 2
    :startinline: true

Incoming data
=============

.. code-block:: php
    :include: example/incoming.txt
    :hl_lines: 3, 4
    :startinline: true

Incoming data
=============

.. code-block:: php
    :include: example/incoming.txt
    :hl_lines: 5
    :startinline: true

Incoming data
=============

.. code-block:: php
    :include: example/incoming.txt
    :hl_lines: 6, 7, 8, 9, 10
    :startinline: true

Incoming data
=============

.. code-block:: php
    :include: example/incoming.txt
    :hl_lines: 11
    :startinline: true

.. raw:: pdf

    TextAnnotation "Some of the information sent to our endpoint."

Implementation
==============

* If no error, create the job node, return OK response to Broadbean
* If an Exception is thrown, return an error code and message

.. raw:: pdf

    TextAnnotation "Required field missing."
    TextAnnotation "Branch name incorrect, Exception caught."

Types of tests
==============

* **Functional**: job nodes are created with the correct URL and the correct response code is returned
* **FunctionalJavaScript**: application URL is updated with JavaScript based on UTM parameters (hosting)
* **Kernel**: job nodes can be added and deleted, expired job nodes are deleted, application URL is generated correctly
* **Unit**: ensure number of days are converted to timestamps correctly

Results
=======

* 0 bugs!
* Easier to identify where issues occurred and responsibilities
* Reduced debugging time

.. raw:: pdf

    TextAnnotation "Best case scenario."
    TextAnnotation "Just because there are tests, it doesn't mean that everything works and everything's passing - just the tests that you wrote are passing."
