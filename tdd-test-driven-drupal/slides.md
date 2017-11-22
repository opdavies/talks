autoscale: true
build-lists: true
theme: simple, 1

![](images/title.png)

# __TDD - Test Driven Drupal__

---

[.build-lists: false]

- PHP code
- Mixture of D7 and D8
- SimpleTest (D7)
- PHPUnit (D8)

---

[.build-lists: false]

- Senior Developer at Microserve
- Contrib module maintainer
- Occasional core contributor
- Sticker collector and elePHPant herder
- @opdavies
- oliverdavies.uk

![right](../me-phpnw.png)

---

## I write and release contrib modules for the community.<br><br>
## I write custom modules for client projects.

---

![inline fit](images/timmillwood-ono.png)


^ First experience of testing with a real module.
Used on 11,046 sites (84 D5, 7,094 D6, 3,868 D7).
Currently used on 28,398 (10 D5, 2,207 D6, 23,206 D7, 2,975 D8).
Tests crucial to preventing regressions when adding new features or fixing bugs.

---

## __Why Test?__

- Catch bugs earlier
- Piece of mind
- Prevent regressions
- Write less code
- Documentation
- Drupal core requirement - <https://www.drupal.org/core/gates#testing>
- More important with regular D8 releases

^ Dave Liddament talk - better and cheaper to catch bugs earlier (e.g. whilst developing rather than after it's been released)
Refer to tests when writing implementation code
ONO merge conflict

---

## __Core Testing Gate__

New features should be accompanied by automated tests.

If the feature does not have an implementation, provide a test implementation.

Bug fixes should be accompanied by changes to a test (either modifying an existing test case or adding a new one) that demonstrate the bug.

[.footer: https://www.drupal.org/core/gates#testing]

---

## __Testing in Drupal - SimpleTest__

- Based on <http://www.SimpleTest.org>
- In D7 core
- `*.test` files
- All test classes in one file

---

## __Testing in Drupal - PHPUnit__

- Used in other PHP projects (e.g. Symfony, Laravel)
- In D8 core, but not default
- `*.php` files
- One test class per file

---

## __The PHPUnit Initiative__

- <https://www.drupal.org/node/2807237>
- D8 core tests to change to PHPUnit
- Deprecate SimpleTest, remove in D9
- "A big chunk of old tests" converted on Feb 21st

---

## __The PHPUnit Initiative__

As part of the PHPUnit initiative __a considerable part of Simpletests will be converted to PHPUnit based browser tests on February 21st 2017__. A backwards compatibility layer has been implemented so that many Simpletests can be converted by just using the new BrowserTestBase base class and moving the test file. There is also a script to automatically convert test files in the conversion issue.

__Developers are encouraged to use BrowserTestBase instead of Simpletest as of Drupal 8.3.0__, but both test systems are fully supported during the Drupal 8 release cycle.

The timeline for the deprecation of Simpletest's WebTestBase is under discussion.

[.footer: https://groups.drupal.org/node/516229]

---

## __Types of Tests__

---

## __Unit Tests__

- `UnitTestCase`
- Tests PHP logic
- No database interaction
- Fast to run

---

## __Unit Tests__

__Pros:__

- Verify individual parts
- Quickly find problems in code
- Fast execution
- No system setup for the test run

---

## __Unit Tests__

__Cons:__

- Rewrite on every refactoring
- Complicated mocking
- No guarantee that the whole system actually works

---

## __Kernel Tests__

- Kernel tests are integration tests that test on components. You can install modules.
- `KernelTestBase`

[.footer: https://www.drupal.org/docs/8/testing/types-of-tests-in-drupal-8]

---

## __Kernel Tests__

__Pros:__

- Verify that components actually work together
- Somewhat easy to locate bugs

---

## __Kernel Tests__

__Cons:__

- Slower execution
- System setup required
- No guarantee that end user features actually work

---

## __UI Tests__

- Web/Functional/FunctionalJavascript
- `DrupalWebTestCase` (D7)
- `WebTestBase`, `BrowserTestBase`, `JavascriptTestBase` (D8)
- Tests functionality
- Interacts with database
- Slower to run
- With/without JavaScript (D8)

^ - Use JavascriptTestBase when you need to test how the system works for a user with Javascript enabled.

---

## __Test Driven Development (TDD)__

- Write a test, see it fail
- Write code until test passes
- Repeat
- Refactor when tests are green

![right 100%](images/tdd-circle-of-life.png)

[.footer: http://www.agilenutshell.com/assets/test-driven-development/tdd-circle-of-life.png]

^ "Grab for green."
Not the only way
Write code beforehand and test afterwards
Write code first, comment out/reset branch, then TDD

---

## __Porting Modules to Drupal 8__

- Make a new branch 
  `git checkout --orphan 8.x-1.x`
- Add/update the tests
- Write code to make the tests pass
- Refactor
- Repeat

---

## __Writing Tests (SimpleTest)__

---



```ini
# example.info

name = Example
core = 7.x
files[] = example.test
```

---



```php
// example.test

class ExampleTestCase extends DrupalWebTestCase {

  public static function getInfo() {
    return array(
      'name' => 'Example tests',
      'description' => 'Web tests for the example module.',
      'group' => 'Example',
    );
  }

}
```

---

```php, [.highlight: 5-7]
class ExampleTestCase extends DrupalWebTestCase {

  ...

  public function testSomething {
    $this->assertTrue(TRUE);
  }

}
```

---

## __Writing Tests (PHPUnit)__

- No need to load test classes expicitly.
- Add classes into `tests/src` directory.
- Extend `BrowserTestBase`.
- No `getInfo` method.

^ Classes get autoloaded PSR-4

---



## __Creating the World__

```php
public function setUp() {
  // Enable any other required modules.
  parent::setUp(['foo', 'bar']);

  // Anything else we need to do.
}
```

---



## __Creating the World__

```php
$this->drupalCreateUser();

$this->drupalLogin();

$this->drupalCreateNode();

$this->drupalLogout();
```

---

## __Assertions__

- `assertTrue`
- `assertFalse`
- `assertNull`
- `assertNotNull`
- `assertEqual`
  `assertEquals`

---

## __Assertions__

- `assertRaw`
- `assertResponse`
  `assertSession()->statusCodeEquals()`
- `assertField`
- `assertFieldById`
- `assertTitle`

---

## __Assertions__

- `assertText`
  `assertSession()->pageTextContains()`
- `assertNoText`
  `assertSession()->pageTextNotContains()`

---

# __Running Tests__

---

## __SimpleTest UI__

---

![fit](images/simpletest-1.png)

---

![fit](images/simpletest-2.png)

---

![fit](images/simpletest-3.png)

---

![fit](images/simpletest-4.png)

---

## __Running SimpleTest (CLI)__



```bash
# Drupal 7
$ php scripts/run-tests.sh

# Drupal 8
$ php core/scripts/run-tests.sh
```

---

## __Running SimpleTest (CLI)__

```bash
--color

--verbose

--all

--module

--class

--file
```

---

## __Running PHPUnit__

```bash
# Assumes you have a configured phpunit.xml file.

$ vendor/bin/phpunit

$ vendor/bin/phpunit [directory]

$ vendor/bin/phpunit --filter [method]

$ vendor/bin/phpunit --verbose --debug
```

^ Either need to be inside "core" directory or use "-c core"

---

## __Example: Collection Class__

---

## __Collection Class__

- <http://dgo.to/collection_class>
- Adds a `Collection` class, based on Laravel’s
- Provides helper methods for array methods
- Drupal 7, uses xautoload
- All unit tests

^ xautoload gives PSR-4 namespaces and autoloading similar to Drupal 8.

---



```php
$collection = collect([1, 2, 3, 4, 5]);

// Returns all items.
$collection->all();

// Counts the number of items.
$collection->count();

// Returns the array keys.
$collection->keys();
```

---



```php
namespace Drupal\collection_class;

class Collection implements \Countable, \IteratorAggregate {
  private $items;

  public function __construct($items = array()) {
    $this->items = is_array($items) ? $items
      : $this->getArrayableItems($items);
  }

  public function __toString() {
    return $this->toJson();
  }

  ...
```

---



```php
public function all() {
  return $this->items;
}

public function count() {
  return count($this->items);
}


public function isEmpty() {
  return empty($this->items);
}

public function first() {
  return array_shift($this->items);
}
```

---

## __Testing__

```php
public function setUp() {
  $this->firstCollection = collect(['foo', 'bar', 'baz']);

  $this->secondCollection = collect([
      array('title' => 'Foo', 'status' => 1),
      array('title' => 'Bar', 'status' => 0),
      array('title' => 'Baz', 'status' => 1)
  ]);

  parent::setUp();
}
```

---

## __Testing__

```php
public function testCollectFunction() {
  $this->assertEqual(
    get_class($this->firstCollection),
    'Drupal\collection_class\Collection'
  );
}
```

---

## __Testing__

```php
public function testAll() {
  $this->assertEqual(
    array('foo', 'bar', 'baz'),
    $this->firstCollection->all()
  );
}
```

---

## __Testing__

```php
public function testCount() {
  $this->assertEqual(
    3,
    $this->firstCollection->count()
  );
}
```

---

## __Testing__

```php
public function testMerge() {
  $first = collect(array('a', 'b', 'c'));
  $second = collect(array('d', 'e', 'f'));

  $this->assertEqual(
    array('a', 'b', 'c', 'd', 'e', 'f'),
    $first->merge($second)->all()
  );
}
```

---

![fit](images/collection-class-1.png)

---

![fit](images/collection-class-2.png)

---

## __Example: Toggle Optional Fields__

---

## __Toggle Optional Fields__

- <http://dgo.to/toggle_optional_fields>
- Adds a button to toggle optional fields on node forms using form alters
- Possible to override using an custom alter hook
- Uses unit and web tests

![right 85%](images/toggle-optional-fields-button.png)

---

```php
// Looping through available form elements...

// Only affect fields.
if (!toggle_optional_fields_element_is_field($element_name)) {
  return;
}

$element = &$form[$element_name];

if (isset($overridden_fields[$element_name])) {
  return $element['#access'] = $overridden_fields[$element_name];
}

// If the field is not required, disallow access to hide it.
if (isset($element[LANGUAGE_NONE][0]['#required'])) {
  return $element['#access'] = !empty($element[LANGUAGE_NONE][0]['#required']);
}
```

---

## __What to Test?__

- **Functional:** Are the correct fields shown and hidden?
- **Unit:** Is the field name check returning correct results?

---

## __Unit Tests__

```php
// Returns TRUE or FALSE to indicate if this is a field.

function toggle_optional_fields_element_is_field($name) {
  if (in_array($name, array('body', 'language'))) {
    return TRUE;
  }

  return substr($name, 0, 6) == 'field_';
}
```

---

## __Unit Tests__

```php
public function testElementNameIsField() {
  ...

  $this->assertTrue(
    toggle_optional_fields_element_is_field('field_tags')
  );

  $this->assertTrue(
    toggle_optional_fields_element_is_field('body')
  );

  $this->assertFalse(
    toggle_optional_fields_element_is_field('title')
  );
}
```

---

## __Unit Tests__

```php
public function testElementNameIsField() {
  ...

  foreach ($this->elementNameDataProvider() as $data) {
    list($element_name, $expected_result) = $data;

    $this->assertEquals(
      $expected_result,
      toggle_optional_fields_element_is_field($element_name)
    );
  }
}

private function elementNameDataProvider() {
  return array(
    array('body', TRUE),
    array('field_tags', TRUE),
    array('title', FALSE),
  );
}
```

---

![fit](images/toggle-optional-fields-1.png)

---

## __Web Tests__

```php
public function setUp() {
  parent::setUp();

  $this->drupalLogin(
    $this->drupalCreateUser(array(
      'create article content',
      'create page content'
    ));
  );

  // Enable toggling on article node forms.
  variable_set('toggle_optional_fields_node_types', array('article'));

  $this->refreshVariables();
}
```

---

## __Custom Assertions__

```php
private function assertTagsFieldNotHidden() {
  $this->assertFieldByName(
    'field_tags[und]',
    NULL,
    t('Tags field visible.')
  );
}
```

---

## __Testing Hidden Fields__

```php
public function testFieldsHiddenByDefault() {
  variable_set('toggle_optional_fields_hide_by_default', TRUE);

  $this->refreshVariables();

  $this->drupalGet('node/add/article');

  $this->assertShowOptionalFieldsButtonFound();
  $this->assertHideOptionalFieldsButtonNotFound();
  $this->assertTagsFieldHidden();

  ...
```

---

## __Testing Hidden Fields__

```php
  ...

  $this->drupalPost(
    'node/add/article',
    array(),
    t('Show optional fields')
  );

  $this->assertHideOptionalFieldsButtonFound();
  $this->assertShowOptionalFieldsButtonNotFound();
  $this->assertTagsFieldNotHidden();
}
```

---

![fit](images/toggle-optional-fields-2.png)

---

![fit](images/toggle-optional-fields-3.png)

---

# __Building a new Drupal <br>8 Module with TDD__

---

As a site visitor

I want to see a list of all published pages at `/pages`

Ordered alphabetically by title.

---

```yml
# tdd_dublin.info.yml

name: DrupalCamp Dublin test
core: 8.x
type: module
```

---

```php
// tests/src/Functional/ListingPageTest.php

class ListingPageTest extends BrowserTestBase {

  protected static $modules = ['tdd_dublin'];

  public function testListingPageExists() {
    $this->drupalGet('pages');

    $this->assertSession()->statusCodeEquals(200);
  }
}
```

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests/
E

Time: 25.94 seconds, Memory: 6.00MB

There was 1 error:

1) PageListTest::testListingPage
Behat\Mink\Exception\ExpectationException: Current response status code is 404,
but 200 expected.

/var/www/vendor/behat/mink/src/WebAssert.php:770
/var/www/vendor/behat/mink/src/WebAssert.php:130
/var/www/modules/tdd_dublin/tests/src/PageListTest.php:11
```

---

- Add the view.
- Copy the config into the module’s `config/install`.

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests/
E

Time: 19.07 seconds, Memory: 6.00MB

There was 1 error:

1) PageListTest::testListingPage
Drupal\Core\Config\UnmetDependenciesException:
Configuration objects provided by <em class="placeholder">tdd_dublin</em>
have unmet dependencies:
<em class="placeholder">node.type.page (node),
views.view.pages (node, views)</em>
```

---

```yml
name: DrupalCamp Dublin tests
core: 8.x
type: module

dependencies:
  - drupal:node
  - drupal:views
```

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests/
.

Time: 29.58 seconds, Memory: 6.00MB

OK (1 test, 1 assertion)
```

---

```php
public function testOnlyPublishedPagesAreShown() {
  // Given I have a mixture of published and unpublished pages,
  // as well as other types of content.

  // When I view the pages list.

  // I should only see the published pages.
}
```

---

```php
public function testOnlyPublishedPagesAreShown() {
  $this->drupalCreateContentType(['type' => 'article']);

  $nodeA = $this->drupalCreateNode(['type' => 'page', 'status' => TRUE]);
  $nodeB = $this->drupalCreateNode(['type' => 'article']);
  $nodeC = $this->drupalCreateNode(['type' => 'page', 'status' => FALSE]);

  // When I view the pages list.

  // I should only see the published pages.
}
```

---

```php
public function testOnlyPublishedPagesAreShown() {
  ...

  $this->drupalGet('/pages');

  $this->assertSession()->statusCodeEquals(200);

  $this->assertSession()->pageTextContains($nodeA->label());

  $this->assertSession()->pageTextNotContains($nodeB->label());
  $this->assertSession()->pageTextNotContains($nodeC->label());
}
```

---

```php
public function testOnlyPublishedPagesAreShown() {
  $this->drupalCreateContentType(['type' => 'article']);

  $this->drupalCreateNode(['type' => 'page', 'status' => TRUE]);
  $this->drupalCreateNode(['type' => 'article']);
  $this->drupalCreateNode(['type' => 'page', 'status' => FALSE]);

  $results = views_get_view_result('pages');

  $nids = array_column($results, 'nid'); // [1, 3]

  // I should only see the published pages.
}
```

---

```php
public function testOnlyPublishedPagesAreShown() {
  $this->drupalCreateContentType(['type' => 'article']);

  $this->drupalCreateNode(['type' => 'page', 'status' => TRUE]);
  $this->drupalCreateNode(['type' => 'article']);
  $this->drupalCreateNode(['type' => 'page', 'status' => FALSE]);

  $results = views_get_view_result('pages');

  $nids = array_column($results, 'nid'); // [1, 3]

  $this->assertEquals([1], $nids);
}
```

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests
--filter=testOnlyPublishedPagesAreShown
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests
F

Time: 26.4 seconds, Memory: 6.00MB

There was 1 failure:
```

---

```
1) PageListTest::testOnlyPublishedPagesAreShown
Failed asserting that two arrays are equal.
--- Expected
+++ Actual
@@ @@
 Array (
-    0 => 1
+    0 => '1'
+    1 => '3'
 )

/var/www/tests/Drupal/Tests/BrowserTestBase.php:1240
/var/www/modules/tdd_dublin/tests/src/PageListTest.php:25

FAILURES!
Tests: 1, Assertions: 3, Failures: 1.
```

---

[.build-lists: false]

- Edit the view
- Add the status filter
- Update the module config

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests
--filter=testOnlyPublishedPagesAreShown
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests
.

Time: 26.53 seconds, Memory: 6.00MB

OK (1 test, 3 assertions)
```

---

```php
public function testPagesAreOrderedAlphabetically() {
  // Given I have multiple pages with different titles.

  // When I view the pages list.

  // I see the pages in the correct order.
}
```

---

```php
public function testPagesAreOrderedAlphabetically() {
  $this->drupalCreateNode(['title' => 'Page A']);
  $this->drupalCreateNode(['title' => 'Page D']);
  $this->drupalCreateNode(['title' => 'Page B']);
  $this->drupalCreateNode(['title' => 'Page C']);

  $results = views_get_view_result('pages');

  $nids = array_column($results, 'nid');

  $this->assertEquals([1, 3, 4, 2], $nids);
}
```

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests 
-filter=testPagesAreOrderedAlphabetically
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests
F

Time: 28.03 seconds, Memory: 6.00MB

There was 1 failure:
```

---

```
1) PageListTest::testPagesAreOrderedAlphabetically
Failed asserting that two arrays are equal.
--- Expected
+++ Actual
@@ @@
 Array (
-    0 => 1
-    1 => 3
-    2 => 4
-    3 => 2
+    0 => '1'
+    1 => '2'
+    2 => '3'
+    3 => '4'
 )

/var/www/tests/Drupal/Tests/BrowserTestBase.php:1240
/var/www/modules/tdd_dublin/tests/src/PageListTest.php:36
```

---

- Edit the view
- Remove the default sort criteria (created on)
- Add new sort criteria
- Update the module config

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests
--filter=testPagesAreOrderedAlphabetically
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests
.

Time: 27.67 seconds, Memory: 6.00MB

OK (1 test, 2 assertions)
```

---

```
docker@cli:/var/www$ vendor/bin/phpunit -c core modules/tdd_dublin/tests
PHPUnit 4.8.36 by Sebastian Bergmann and contributors.

Testing modules/tdd_dublin/tests
...

Time: 1.17 minutes, Memory: 6.00MB

OK (3 tests, 6 assertions)
```

---

## __Downgrading to Kernel Tests__

---

```php
// tests/src/Kernel/PageListTest.php

namespace Drupal\Tests\tdd_dublin\Kernel;

use Drupal\KernelTests\KernelTestBase;

class PageListTest extends KernelTestBase {
}
```

---

```php
public function testOnlyPublishedPagesAreShown() {
  $nids = array_column(views_get_view_result('pages'), 'nid');

  $this->assertEquals([1], $nids);
}
```

^ Started with assertions and worked backwards
"Outside in"

---

```php
protected static $modules = [
  'node',
  'system',
  'tdd_dublin',
  'user',
  'views'
];

protected function setUp() {
  parent::setUp();

  $this->installConfig(['tdd_dublin']);

  $this->installEntitySchema('node');
  $this->installEntitySchema('user');
}
```

---

```php
use Drupal\node\Entity\Node;
use Drupal\node\Entity\NodeType;

public function testOnlyPublishedPagesAreShown() {
  NodeType::create(['type' => 'article', 'name' => t('Article')]);

  Node::create($this->getValidParams(['status' => TRUE]))->save();
  Node::create($this->getValidParams(['type' => 'article']))->save();
  Node::create($this->getValidParams(['status' => FALSE]))->save();

  $nids = array_column(views_get_view_result('pages'), 'nid');

  $this->assertEquals([1], $nids);
}

private function getValidParams(array $overrides = []) {
  return array_merge([
    'status' => TRUE,
    'title' => $this->randomString(),
    'type' => 'page',
  ], $overrides);
}
```

---

```
Testing modules/custom/tdd_dublin/tests/src/Kernel
.

Time: 8.9 seconds, Memory: 6.00MB

OK (1 test, 4 assertions)
```

^ Previously 26 seconds

---

![inline fit](images/kernel-tests.png)

---

## __Demo__

---

- Testing has made me a better developer
- Testing can produce better quality code
- Use the right type of test for the right situation
- Writing tests is an investment
- OK to start small, introduce tests gradually
- Easier to refactor
- Tests can pass, but things can still be broken. Tests only report on what they cover.

^ Made me think about how I'm going to do something more starting to do it
Less cruft, only write code that serves a purpose
Spending time writing tests pays dividends later on
Start by introducing tests for new features or regression tests when fixing bugs
If you know things pass, then you can refactor code knowing if something is broken
Manual testing is still important

---

- https://github.com/opdavies/tdd_dublin
- https://www.oliverdavies.uk/blog/2017/11/07/writing-drupal-module-test-driven-development-tdd
- https://www.oliverdavies.uk/blog/tdd-drupal-part-2-kernel-tests
- https://knpuniversity.com/screencast/phpunit
- https://adamwathan.me/test-driven-laravel
- https://laracasts.com
- https://drupalize.me/series/testing-drupal-7-simpletest
- https://www.lullabot.com/articles/an-overview-of-testing-in-drupal-8
- https://www.youtube.com/watch?v=jcdEp3YGa94

---

## __Questions?__
