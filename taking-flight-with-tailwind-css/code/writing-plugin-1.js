// Start require plugin
const plugin = require("tailwindcss/plugin");
// End require plugin

// Start add function
const plugin = require("tailwindcss/plugin");

module.exports = plugin(function({ addUtilities }) {

})
// End add function

// Start function contents
const plugin = require("tailwindcss/plugin");

module.exports = plugin(function({ addUtilities }) {
  addUtilities({
    '.list-reset': {
      listStyle: 'none',
      padding: 0,
    },
  })
})
// End function contents
