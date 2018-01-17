autoscale: true
build-lists: true
theme: Fira, 1

[.hide-footer]

# [fit] _**Taking Flight with**<br>Tailwind CSS_

---

[.build-lists: false]

- Full Stack Web Developer
- Acquia certified Drupal specialist
- @opdavies
- oliverdavies.uk

---

> A Utility-First CSS Framework for Rapid UI Development

^ What is Tailwind?

---

[.build-lists: false]

- Utility CSS class generator
- PostCSS
- Configurable
- Some preprocessor features
- Can be used in addition to preprocessors
- Open source

^ Works with plain CSS or any preprocessor
Can be configured to enable/disable modules, configure colours etc.
Can use features like variables if using plain CSS.

---

```css
.title {
    background-color: #3490DC;
    color: #FFF;
    display: block;
    font-size: 1.5rem;
    padding: 2rem;
}
```

---

```css
.text-2xl {
    font-size: 1.5rem;
}

.bg-blue {
    background-color: #3490DC;
}

.text-white {
    color: #FFF;
}
```

---

```html
<div class="text-2xl bg-blue-dark text-white p-8">
    <p>Hello, Drupal Bristol!</p>
</div>
```

---

![fit](images/1.png)

---

## __Installation__

---

## Option 1

```
https://cdn.jsdelivr.net/npm/tailwindcss/dist/tailwind.min.css
```

---

## Option 2

```bash
yarn add postcss tailwindcss --save

yarn run tailwind init
```

^ Install with npm or Yarn
Run "tailwind init" to generate a default tailwind.js file

---

```js
// tailwind.js

var colors = {
  'transparent': 'transparent',

  'black': '#222b2f',
  'grey-darkest': '#364349',
  'grey-darker': '#596a73',
  'grey-dark': '#70818a',
  'grey': '#9babb4',
  'grey-light': '#dae4e9',
  'grey-lighter': '#f2f2f2',
  'grey-lightest': '#fafcfc',
  'white': '#ffffff',
  ...
```

---

```js
// postcss.config.js

module.exports = {
  plugins: [
    require('tailwindcss')('./tailwind.js'),
    require('autoprefixer'),
  ]
}
```

---

```less
// main.less

@tailwind preflight;

// Any custom styles.

@tailwind utilities;
```

---

```js
// webpack.config.js

Encore
    ...
    .enableLessLoader()
    .addStyleEntry('site', './less/main.less')
    .enablePostCssLoader(function(options) {
        options.config = {
            path: 'postcss.config.js'
        };
    })
    ...
;
```

^ Using Webpack Encore

---

```html
<head>
    <title>Hello, World!</title>
    <link rel="stylesheet" href="/build/site.css">
...
```

---

```
.text-left {
    text-align: left;
}

.text-center {
    text-align: center;
}

.text-right {
    text-align: right;
}

.text-justify {
    text-align: justify;
}
```

---

```html
<div class="text-bold text-red bg-blue">
    Hello, world!
</div>
```

---

## __Configuration__

---

```javascript
// tailwind.js

var colors = {
  ...

  'blue-darkest': '#05233b',
  'blue-darker': '#103d60',
  'blue-dark': '#2779bd',
  'blue': '#0678be',
  'blue-light': '#6cb2eb',
  'blue-lighter': '#bcdefa',
  'blue-lightest': '#eff8ff',

  ...
}
```

^ Add, change, remove values as needed

---

```js
screens: {
  'sm': '576px',
  'md': '768px',
  'lg': '992px',
  'xl': '1200px',
}
```

---

```js
textSizes: {
  'xs': '.75rem',     // 12px
  'sm': '.875rem',    // 14px
  'base': '1rem',     // 16px
  'lg': '1.125rem',   // 18px
  'xl': '1.25rem',    // 20px
  '2xl': '1.5rem',    // 24px
  '3xl': '1.875rem',  // 30px
  '4xl': '2.25rem',   // 36px
  '5xl': '3rem',      // 48px
}
```

---

```js
width: {
  'auto': 'auto',
  'px': '1px',
  '1': '0.25rem',
  '2': '0.5rem',
  '3': '0.75rem',
  '4': '1rem',
  '6': '1.5rem',
  '8': '2rem',
  '10': '2.5rem',
  '12': '3rem',
  '16': '4rem',
  '24': '6rem',
  ...
}
```

---

```js
padding: {
  'px': '1px',
  '0': '0',
  '1': '0.25rem',
  '2': '0.5rem',
  '3': '0.75rem',
  '4': '1rem',
  '5': '1.25rem',
  '6': '1.5rem',
  '8': '2rem',
  '16': '4rem',
}
```

---

```javascript
options: {
  prefix: '',
  important: false,
  separator: ':',
}
```

^ - Drupal important config
- By adding a prefix, we don't clash with Drupal's core styles - e.g. ".block"

---

[.build-lists: false]

- Colours (text and background)
- Font family, size, weight
- Leading (line height), tracking (letter spacing)
- Border widths, colours, radius
- Width, height, min/max width/height

---

[.build-lists: false]

- Padding, margin (positive and negative)
- Shadows
- Z-index
- Opacity
- SVG fill, stroke
- Screen sizes (breakpoints)

---

## __States__

### Hover, Focus, Active

---

```css
.{state}{separator}{class}
```

---

```twig
<a class="bg-grey hover:bg-grey-dark focus:bg-grey-dark" href="/">
    Home
</a>
```

---

## __Responsive__

---

```less
.{screen}{separator}{class}
```

---

```html
<div class="block sm:inline-block md:flex lg:block">
    <p>Hello, World!</p>
</div>
```

---

## __Extracting <br>Components__

---

```twig
{% for item in items %}
    <a class="block py-3 px-4 text-sm text-grey" href="{{ item.url }}">
        {{ item.title }}
    </a>
{% endfor %}
```

---

```html
<a href="inline-block rounded text-sm py-2 px-3 text-white bg-red">
    Click me!
</a>

<a href="inline-block rounded text-sm py-2 px-3 text-white bg-green">
    Click me too!
</a>
```

---

```less
// main.less

.button {
    .inline-block;
    .rounded;
    .text-sm;
    .py-2;
    .px-3;
    .text-white;
}
```

---

```css
# main.css

.button {
    @apply .inline-block;
    @apply .rounded;
    @apply .text-sm;
    @apply .py-2;
    @apply .px-3;
    @apply .text-white;
}
```

---

```html
<a href="button bg-red">
    Click me!
</a>

<a href="button bg-green">
    Click me too!
</a>
```

---

```less
// table.less

.table-responsive {
    @apply .mb-4 .border .w-full;
    overflow-x: auto;
    overflow-y: hidden;
}

.table-responsive table {
    @apply .mb-0 .border-0 .whitespace-no-wrap;
}

.table {
    @apply .w-full .table-collapse;
}

.table tr:nth-child(odd) {
    @apply .bg-grey-lightest;
}

.table tr th {
    @apply .text-left .p-3 .bg-white;
}

.table td {
    @apply .px-3 .py-3 .border-t;
}
```

---

## Advantages

- Quick to prototype and make changes
- Write less CSS
- More consistency
- Easy to customise, promote to components
- Mix and match with normal CSS

^ Do more with browser dev tools
Only picking from pre-defined colours, widths. No magic numbers.
Less ramp-up time as using the same framework on different sites.
Same classes, but no visual similarities like with other frameworks like Bootstrap

---

## Disadvantages

- Extra build tools and steps
- Lots of classes in markup
- Large file size by default

^ - Need a build tool (Gulp, Grunt, Webpack) to build CSS


---

## For Drupal

- Add a prefix to avoid clashing
- Enable `important` setting to override existing styles
- Add classes in templates where possible
- Use `@apply` to limit the number of templates, to avoid adding classes in PHP code or config (e.g. Views), to style hard-to-reach elements

---

## Resources

- tailwindcss.com
- tailwindcomponents.com
- github.com/merchedhq/awesome-tailwindcss
- youtube.com/adamwathan
- github.com/opdavies/oliverdavies.uk
- github.com/phpsw/phpsw-ng

---

## __Thank you__

### @opdavies
