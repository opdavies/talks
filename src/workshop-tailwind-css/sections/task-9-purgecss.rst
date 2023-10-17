.. page:: titlePage

.. class:: centredtitle

Task 9: Configure PurgeCSS

.. page:: standardPage

.. code-block::
    :include: code/yarn-output-before-purge.txt
    :end-before: # yarn prod

.. page::

.. code-block::
    :include: code/yarn-output-before-purge.txt
    :start-at: # yarn prod

Configuring PurgeCSS
--------------------

.. code-block:: diff 
    :include: code/configuring-purgecss.txt

.. page::

.. code-block::
    :include: code/yarn-output-after-purge.txt
