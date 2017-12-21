autoscale: true
build-lists: true
theme: simple, 1

# __Using Laravel Collections... <br>Outside Laravel__

![250%](images/laravel.png)

---

[.build-lists: false]

- Web Developer
- Drupal, Symfony, Silex, Laravel, Sculpin
- @opdavies
- oliverdavies.uk

![right](../../me-phpnw.png)

---

## Collections++

^ Became a fan of Collections whilst learning Laravel
Powerful object orientated way to interact with arrays
Store items within the collection, run methods, chainable
More readable, less temporary variables
Video on Laracasts, Adam Wathan's refactoring to Collections
Wanted to use them with different PHP projects e.g. Drupal

---

```php
collect(['foo', 'bar']); // ['foo', 'bar']

collect('foobar'); // ['foobar']

$object = new stdClass();
$object->foo = 'bar'; 
collect($object); // ['foo' => 'bar']
collect($object)->get('foo'); // bar
```

^ How do you make a collection?
collect function is provided
String, array or object
Stored as items within the Collection object

---

```php
$collection = collect(['a', 'b', 1, 'c', 2, 'd', 'e', 3, 4]);

$collection->count(); // 9

$collection->first(); // a

$collection->first(function ($item) {
  return is_numeric($item);
}); // 1

$collection->contains(2); // true

$collection->contains([2, 10]); // false

$collection->filter(function ($item) {
  return $item > 2;
}); // [3, 4]
```

^ Once you have a collection, what can you do with it?
"contains" - no more needle/haystack, haystack/needle
"filter" - filters false, null values
Can pass callbacks to `first` and `filter`, return true or false as needed.

---

```php
$collection = collect([
    ['name' => 'John', 'email' => 'john@example.com', 'age' => 31],
    ['name' => 'Jane', 'email' => 'jane@example.com', 'age' => 27],
]);

$collection->pluck('name'); // ['John', 'Jane']

$collection->pluck('name')->sort(); // ['Jane', 'John']

$collection->filter(function ($person) {
    return $person['age'] >= 30;
})->pluck('name'); // ['John']
```

---

![100%](images/druplicon.png)

^ This is great, but how can I do that in my Drupal code?
How can I do that?

---

> There’s a module for that!
> -- Drupalers

---

> There's not a module for that. :(
-- Me

---

![fit](images/collection-class-module-project-page-1.png)

^ Drupal 7

---


## 1.0: Write my own Collection class

^ Wrote my own Collection class
Wrote my own tests

---

![](images/drupal-issue-1.png)

^ Maybe 70% of what Laravels' could do.

---

![](images/packagist.png)

^ Can't remember how, but then I found this.

---


> Collect - Illuminate Collections as a separate package.
> -- https://packagist.org/packages/tightenco/collect

---

> Import Laravel's Collections into non-Laravel packages easily, without needing to require the entire Illuminate\Support package.
> -- https://packagist.org/packages/tightenco/collect

---

![600%](images/composer.png)

^ Can install via Composer

---

## `composer require tightenco/collect`

---
![](images/drupal-issue-2.png)

---

![fit](images/collection-class-module-project-page-2.png)

---

## ~~1.0: Write my own Collection class~~
## 2.0: Use someone else’s Collection class

^ More fully featured, less code to maintain

---

![120%](images/yay-open-source.jpg)

---

[.build-lists: false]

- Install Composer
- Require `tightenco/collect`
- Include `autoload.php`
- `collect()` away!

---

[.build-lists: false]

- Install Composer
- Require `tightenco/collect`
- Include `autoload.php`
- `collect()` away!

![100%](images/drupal-8.png)

---

```php
// index.php

require __DIR__ . '/vendor/autoload.php';

$collection = collect(['foo', 'bar']);

$collection->each(function ($item) {
    // Do something.
});
```

^ Require/include autoload.php
Start using Collections!
`collect` function is autoloaded

---

![150%](images/all-the-things.jpg)

^ Drupal 8, Sculpin site, PHP libraries

---

## __Thanks!__

## @opdavies
