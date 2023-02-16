.. raw:: pdf

   PageBreak titlePage

.. class:: centredtitle

Adding Tailwind CSS to an existing project


.. raw:: pdf

   PageBreak standardPage

Disabling the reset styles
==========================

.. code-block:: javascript
   :linenos:
   :hl_lines: 7 8 9

    /** @type {import('tailwindcss').Config} */
    module.exports = {
      content: [],
      theme: {
        extend: {},
      },
      corePlugins: {
        preflight: false,
      },
      plugins: [],
    }

Prefixing class names
=====================

Turn classes like ``flex`` into ``tw-flex``.

|

.. code-block:: javascript
   :linenos:
   :hl_lines: 3

    /** @type {import('tailwindcss').Config} */
    module.exports = {
      prefix: "tw-",
      content: [],
      theme: {
        extend: {},
      },
      plugins: [],
    }

!important
==========

.. code-block:: javascript
   :linenos:
   :hl_lines: 3

    /** @type {import('tailwindcss').Config} */
    module.exports = {
      important: true,
      content: [],
      theme: {
        extend: {},
      },
      plugins: [],
    }

!important
==========

.. code-block:: javascript
   :linenos:
   :hl_lines: 3

    /** @type {import('tailwindcss').Config} */
    module.exports = {
      important: "#app",
      content: [],
      theme: {
        extend: {},
      },
      plugins: [],
    }

!important
==========

|

|

.. class:: centredtitle

``!flex``
