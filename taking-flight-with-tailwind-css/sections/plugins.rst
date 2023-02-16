.. page:: titlePage

.. class:: centredtitle

Extending Tailwind CSS with Plugins

.. page::

.. class:: centredtitle

``npm install --save-dev
tailwindcss-list-reset``

.. page:: standardPage

Adding a plugin
===============

.. code-block:: javascript
    :linenos:
    :include: code/plugins-add-plugin.txt

Generated CSS
=============

.. code-block:: css
   :linenos:
   :include: code/plugins-generated-css.txt

Writing plugins
===============

.. code-block:: javascript 
   :linenos:
   :include: code/plugins-plugin-source.txt

Writing plugins
===============

Adding `child` and `child-hover` variants:

|

.. code-block:: javascript 
   :linenos:

   const plugin = require('tailwindcss/plugin');

   module.exports = plugin(({ addVariant }) => {
     addVariant('child', '& > *');
     addVariant('child-hover', '& > *:hover');
   });

Writing plugins
===============

Adding a `hocus` variant:

|

.. code-block:: javascript 
   :linenos:

   const plugin = require('tailwindcss/plugin');

   module.exports = plugin(({ addVariant }) => {
     addVariant('hocus', ['&:hover', '&:focus']);
   });

Writing plugins
===============

Creating a button component:

|

.. code-block:: javascript 
    :linenos:

    plugin(function ({ addComponents, theme }) {
      let styles = {
        primary: {
          default: {
            backgroundColor: theme("colors.primary.DEFAULT"),
            border: `2px solid ${theme("colors.primary.dark")}`,
            borderRadius: "10px",
            color: theme("colors.white"),
            cursor: "pointer",
            padding: `${theme("padding.3")} ${theme("padding.12")}`,
          },

          hover: {
            backgroundColor: theme("colors.white"),
            color: theme("colors.primary.DEFAULT"),
          },
        },
      }

      addComponents({
        "#edit-checkout.button": styles.primary.default,
        "#edit-checkout.button:hover, #edit-checkout.button:focus":
          styles.primary.hover,
      })
    })
