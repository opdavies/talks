.. page:: titlePage

.. class:: centredtitle

Task 9: Configure PurgeCSS

.. page:: standardPage

.. code-block::
    :include: code/yarn-output-before-purge.txt
    :end-before: # yarn prod

.. raw:: pdf

    PageBreak

.. code-block::
    :include: code/yarn-output-before-purge.txt
    :start-at: # yarn prod

Configuring PurgeCSS
--------------------

.. code-block:: diff 
    :include: code/configuring-purgecss.txt

.. raw:: pdf

    PageBreak

.. code-block::
    :include: code/yarn-output-after-purge.txt
