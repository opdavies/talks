// Start create plugin
const plugin = require("tailwindcss/plugin");

module.exports = plugin(({ addComponents, theme }) {

});
// End create plugin

// Start define styles
const plugin = require("tailwindcss/plugin");

module.exports = plugin(({ addComponents, theme }) {
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
});

// End define styles

// Start add components
const plugin = require("tailwindcss/plugin");

module.exports = plugin(({ addComponents, theme }) {

  // ...

  addComponents({
    "#edit-checkout.button": styles.primary.default,
    "#edit-checkout.button:hover, #edit-checkout.button:focus":
      styles.primary.hover,
  });
});
// End add components
