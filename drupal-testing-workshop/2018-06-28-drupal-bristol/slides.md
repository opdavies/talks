autoscale: true
build-lists: true
header-emphasis: #53B0EB
header: alignment(left)
text: alignment(left)
text-emphasis: #53B0EB
theme: poster, 8

[.header: alignment(center)]

![](images/title.png)

# [fit] Drupal Testing Workshop
### _Drupal Bristol, June 2018_

---

[.build-lists: false]

- Module and theme developers
- Want to know more about automated testing
- Looking to start writing your first tests

---

[.background-color: #FFFFFF]
[.build-lists: false]
[.header: #111111]
[.text: #111111, alignment(left)]

![right 800%](../me-phpnw.png)

- Full stack Web Developer & System Administrator
- Senior Developer at Microserve
- Part-time freelancer
- Acquia certified Drupal 8 Grand Master
- Drupal 7 & 8 core contributor
- opdavies (Drupal.org, GitHub, Twitter)
- www.oliverdavies.uk

^ Work at Microserve.
Maintain Drupal modules, PHP CLI tools and libraries
Blog on my website

---

[.header: alignment(center)]

## Test_Driven_Drupal_.com_

---

[.header: alignment(center)]

## _Why_ write tests?

---

## _Why write tests?_

- Catch bugs earlier
- Piece of mind
- Prevent regressions
- Write less code
- Documentation
- Drupal core requirement - _<https://www.drupal.org/core/gates#testing>_
- More important with regular D8 releases

^ Dave Liddament talk - better and cheaper to catch bugs earlier (e.g. whilst developing rather than after it's been released)
Refer to tests when writing implementation code
ONO merge conflict

---

[.header: alignment(center)]

## [fit] _Having tests does not mean_
## [fit] there will be no bugs

---

[.header: alignment(center)]

## [fit] _Testing may add time now_
## [fit] but save more time in the future

---

## _Testing in Drupal_

- _Drupal 7_ - Simpletest (testing) module provided as part of core
- _Drupal 8_ - PHPUnit added as a core dependency
- _PHPUnit Initiative_ - Simpletest to be deprecated and removed in Drupal 9

^ Focussing on PHPUnit today

---

### _Exercise 1_
## Local site setup

---

[.header: #53B0EB]

## Docksal

- Docker based local development environment
- Microserve standard
- Open source
- Per site configuration and customisation
- fin CLI, Apache, MySQL, Solr, Varnish, Mailhog, PHPMyAdmin etc
- Virtualbox or native Docker
- Can slow down tests
- Provides consistency

---

- https://github.com/opdavies/drupal-testing-workshop
- https://docksal.io/installation
- git clone
- fin init
- http://drupaltest.docksal

^ Contains Drupal 8 with Composer, examples module

---

### _Exercise 2_
## Running Tests

---

### _Option 1_
## Simpletest module (UI)

---

![fit](images/d8-simpletest-1.png)

---

![fit](images/d8-simpletest-2.png)

---

![fit](images/d8-simpletest-3.png)

---

![fit](images/d8-simpletest-4.png)

---

![fit](images/d8-simpletest-5.png)

---

![fit](images/d8-simpletest-6.png)

---

![fit](images/d8-simpletest-7.png)

---

### _Option 2_
## Command line

---

## Prerequisite _(creating a phpunit.xml file)_

- Configures PHPUnit
- Needed to run some types of tests
- Ignored by Git by default
- Copy _core/phpunit.xml.dist_ to _core/phpunit.xml_
- Add and change as needed
  - `SIMPLETEST_BASE_URL`, `SIMPLETEST_DB`, `BROWSERTEST_OUTPUT_DIRECTORY`
  - `stopOnFailure="true"`

---

```
cd web

../vendor/bin/phpunit -c core \
modules/contrib/examples/phpunit_example
```

---

```
cd web/core

../../vendor/bin/phpunit \
../modules/contrib/examples/phpunit_example
```

---

## Pro-tip: Add paths to _$PATH_

```bash
# ~/.zshrc

export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=vendor/bin:$PATH
export PATH=../vendor/bin:$PATH
export PATH=node_modules/.bin:$PATH
```

---

### _Option 2_
## CLI with Docksal

---

```
fin bash

cd web

../vendor/bin/phpunit -c core \
modules/contrib/examples/phpunit_example
```

---

```
fin bash

cd web/core

../../vendor/bin/phpunit \
../modules/contrib/examples/phpunit_example
```

---

### _Option 3_
## Docksal PHPUnit addon

---

- Custom Docksal command
- Submitted to the Docksal addons repo
- _fin addon install phpunit_
- Wrapper around phpunit command
- Copies a stub phpunit.xml file if exists, or duplicates phpunit.xml.dist
- Shorter command, combines two actions

^ Checks for core/phpunit.xml on each test run
Will create one if is not present

---

```
fin phpunit web/modules/contrib/examples/phpunit_example
```

---

```
fin phpunit web/modules/contrib/examples/phpunit_example


Copying /var/www/.docksal/drupal/core/phpunit.xml to /var/www/web/core/phpunit.xml
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/contrib/examples/phpunit_example
..................................                                34 / 34 (100%)

Time: 46.8 seconds, Memory: 6.00MB

OK (34 tests, 41 assertions)
```

---

```
fin phpunit web/modules/contrib/examples/phpunit_example


Copying /var/www/web/core/phpunit.xml.dist to /var/www/web/core/phpunit.xml.
Please edit it's values as needed and re-run 'fin phpunit'.
```
---

```
fin phpunit web/modules/contrib/examples/phpunit_example


PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/contrib/examples/phpunit_example
..................................                                34 / 34 (100%)

Time: 48.62 seconds, Memory: 6.00MB

OK (34 tests, 41 assertions)
```

---

### _Option 4_
## IDE/text editor integration

---

![fit](images/phpstorm-integration.png)

---

[.header: alignment(center)]

## Types of tests

---

[.header: alignment(center)]

## _1._ Arrange
## _2._ Act
## _3._ Assert

---

[.header: #53B0EB]

## Functional tests

- Tests functionality
- Interacts with database
- Full Drupal installation
- Slower to run
- With/without JavaScript

^ testing profile

---

### _Exercise_
## Let's write a <br>functional test

---

- Create a _web/modules/custom/drupalbristol_ directory
- Create a `drupalbristol.info.yml` file

---

```
# drupalbristol.info.yml

name: Drupal Bristol
core: 8.x
type: module
```

---

- Create a _tests/src/Functional_ directory
- Create an _ExampleFunctionalTest.php_ file

---


```php
// ExampleFunctionalTest.php

namespace Drupal\Tests\drupalbristol\Functional;

use Drupal\Tests\BrowserTestBase;

class ExampleFunctionalTest extends BrowserTestBase {

}

```

---

```php

// ExampleFunctionalTest.php

public function testExamplePage() {
  $this->drupalGet('/example-one');

  $this->assertSession()->statusCodeEquals(200);
}
```

---

```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing Drupal\Tests\drupalbristol\Functional\ExampleFunctionalTest

Behat\Mink\Exception\ExpectationException : Current response status code is 404, but 200 expected.
 /var/www/vendor/behat/mink/src/WebAssert.php:768
 /var/www/vendor/behat/mink/src/WebAssert.php:130
 /var/www/web/modules/custom/drupalbristol/tests/src/Functional/ExampleFunctionalTest.php:14

Time: 18.2 seconds, Memory: 6.00MB

ERRORS!
Tests: 1, Assertions: 2, Errors: 1.
```

---

- Create a _drupalbristol.routing.yml_ file
- Create a Controller

---

```yaml
# drupalbristol.routing.yml

drupalbristol.example:
  path: '/example-one'
  defaults:
    _controller: 'Drupal\drupalbristol\Controllers\ExampleController::index'
  requirements:
    _access: 'TRUE'
```

---

```php
// src/Controllers/ExampleController.php

namespace Drupal\drupalbristol\Controllers;

use Drupal\Core\Controller\ControllerBase;

class ExampleController extends ControllerBase {

  public function index() {
    return ['#markup' => $this->t('Drupal Testing Workshop')];
  }

}
```

---

```php
class ExampleFunctionalTest extends BrowserTestBase {

  protected static $modules = ['drupalbristol'];

  ...
}
```

---

[.header: #53B0EB]

## Kernel tests

- Integration tests
- Can install modules, interact with services, container, database
- Minimal Drupal bootstrap
- Faster than functional tests
- More setup required

---

### _Exercise_
## Let's write a <br>kernel test

---

- Create a _tests/src/Kernel directory
- Create an _ExampleKernelTest.php_ file
- Create a Service
- Use the service within the test to perform an action

---

```php
// tests/src/Kernel/ExampleKernelTest.php

namespace Drupal\Tests\drupalbristol\Kernel;

use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;
use Drupal\user\Entity\User;

class ExampleKernelTest extends EntityKernelTestBase {

  public static $modules = ['drupalbristol'];

  public function testUserDeleter() {
  }

}

```

---

```php
// tests/src/Kernel/ExampleKernelTest.php

public function testUserDeleter {
  $user = $this->createUser();

  $this->assertInstanceOf(User::class, $user);

  /** @var \Drupal\drupalbristol\Services\UserDeleter $user_deleter */
  $user_deleter = \Drupal::service('drupalbristol.user_deleter');
  $user_deleter->delete($user);

  $user = $this->reloadEntity($user);

  $this->assertNull($user);
}
```

---

```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing Drupal\Tests\drupalbristol\Kernel\ExampleKernelTest

Symfony\Component\DependencyInjection\Exception\ServiceNotFoundException : You have requested a non-existent service "drupalbristol.user_deleter".
 /var/www/vendor/symfony/dependency-injection/ContainerBuilder.php:1043
 /var/www/vendor/symfony/dependency-injection/ContainerBuilder.php:610
 /var/www/vendor/symfony/dependency-injection/ContainerBuilder.php:588
 /var/www/web/core/lib/Drupal.php:159
 /var/www/web/modules/custom/drupalbristol/tests/src/Kernel/ExampleKernelTest.php:24

Time: 7.06 seconds, Memory: 6.00MB


ERRORS!
Tests: 1, Assertions: 3, Errors: 1.

Process finished with exit code 2
```

---

```yaml
# drupalbristol.services.yml

services:
  drupalbristol.user_deleter:
    class: 'Drupal\drupalbristol\Services\UserDeleter'
    arguments: []
```

---

```php
// src/Services/UserDeleter.php

namespace Drupal\drupalbristol\Services;

use Drupal\Core\Session\AccountInterface;

class UserDeleter {

  public function delete(AccountInterface $user) {
    user_delete($user->id());
  }

}
```

---

```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing Drupal\Tests\drupalbristol\Kernel\ExampleKernelTest

Drupal\Core\Entity\EntityStorageException : SQLSTATE[HY000]: General error: 1 no such table: test89378988.users_data: DELETE FROM {users_data}
WHERE uid IN (:db_condition_placeholder_0); Array
(
    [:db_condition_placeholder_0] => 1
)

 /var/www/web/core/lib/Drupal/Core/Entity/Sql/SqlContentEntityStorage.php:777
 /var/www/web/core/includes/entity.inc:281
 /var/www/web/core/modules/user/user.module:878
 /var/www/web/core/modules/user/user.module:865
 /var/www/web/modules/custom/drupalbristol/src/Services/UserDeleter.php:10
 /var/www/web/modules/custom/drupalbristol/tests/src/Kernel/ExampleKernelTest.php:25

 Caused by
 Drupal\Core\Database\DatabaseExceptionWrapper: SQLSTATE[HY000]: General error: 1 no such table: test89378988.users_data: DELETE FROM {users_data}
 WHERE uid IN (:db_condition_placeholder_0); Array
 (
     [:db_condition_placeholder_0] => 1
 )

Time: 6.55 seconds, Memory: 6.00MB

ERRORS!
Tests: 1, Assertions: 3, Errors: 1.

Process finished with exit code 2
```

---

```php
// tests/src/Kernel/ExampleKernelTest.php

protected function setUp() {
  parent::setUp();

  $this->installSchema('user', ['users_data']);
}
```

---

```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing Drupal\Tests\drupalbristol\Kernel\ExampleKernelTest


Time: 7.38 seconds, Memory: 6.00MB

OK (1 test, 5 assertions)

Process finished with exit code 0

```

---

[.header: #53B0EB]

## Unit tests

- Tests PHP logic
- No database interaction
- Fast to run
- Tightly coupled
- Mocking dependencies
- Hard to refactor

---

### _Exercise_
## Let's write a <br>unit test

---

```php
// tests/src/Unit/Services/ExampleUnitTest.php

namespace Drupal\Tests\drupalbristol\Unit;

use Drupal\Tests\UnitTestCase;

class ExampleUnitTest extends UnitTestCase {

  public function testAdd() {
    $this->assertEquals(5, (new Calculator(3))->add(2)->calculate());
  }
}
```

---

```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing Drupal\Tests\drupalbristol\Unit\ExampleUnitTest

Error : Class 'Drupal\Tests\drupalbristol\Unit\Calculator' not found
 /var/www/web/modules/custom/drupalbristol/tests/src/Unit/Services/ExampleUnitTest.php:10

Time: 5.13 seconds, Memory: 6.00MB


ERRORS!
Tests: 1, Assertions: 0, Errors: 1.
```

---

```php
// src/Services/Calculator.php

namespace Drupal\drupalbristol\Services;

class Calculator {

  private $total;

  public function __construct($value) {
    $this->total = $value;
  }

  public function add($value) {
    $this->total += $value;

    return $this;
  }

  public function calculate() {
    return $this->total;
  }

}
```

---

```php
// tests/src/Unit/Services/ExampleUnitTest.php

namespace Drupal\Tests\drupalbristol\Unit;

use Drupal\drupalbristol\Services\Calculator;
use Drupal\Tests\UnitTestCase;

class ExampleUnitTest extends UnitTestCase {

  public function testAdd() {
    $this->assertEquals(5, (new Calculator(3))->add(2)->calculate());
  }

}
```

---

```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing Drupal\Tests\drupalbristol\Unit\ExampleUnitTest


Time: 4.55 seconds, Memory: 4.00MB

OK (1 test, 1 assertion)
```

---

[.header: alignment(center)]

## Test driven <br>development _(TDD)_

---


## _Test Driven Development_

- Write a test
- Test fails
- Write code
- Test passes
- Refactor
- Repeat

---

[.background-color: #FFFFFF]
[.footer: https://github.com/foundersandcoders/testing-tdd-intro]
[.footer-style: #2F2F2F]

![100%](images/tdd-loop.png)

---

## _How I Write Tests - "Outside In"_

- Start with functional tests
- Drop down to kernel or unit tests where needed
- Programming by wishful thinking
- Write comments first, then fill in the code
- Sometimes write assertions first

---

### _Exercise_
## Let's build a blog using test driven development


---

## _Acceptance criteria_

- As a site visitor
- I want to see a list of published articles at /blog
- Ordered by post date

---

## _Tasks_

- Ensure the blog page exists
- Ensure only published articles are shown
- Ensure the articles are shown in the correct order

---

## _Implementation_

- Use views module
- Do the mininum amount at each step, make no assumptions, let the tests guide us
- Start with functional test

---

### _Step 1_
## Create the module

---

```yml
# tdd_blog.info.yml

name: 'TDD Blog'
core: '8.x'
type: 'module'
```

---

### _Step 2_
## Ensure the blog page exists

---


```php
<?php

// tests/src/Functional/BlogPageTest.php

namespace Drupal\Tests\tdd_blog\Functional;

use Drupal\Tests\BrowserTestBase;

class BlogPageTest extends BrowserTestBase {

  protected static $modules = ['tdd_blog'];

  public function testBlogPageExists() {
    $this->drupalGet('/blog');

    $this->assertSession()->statusCodeEquals(200);
  }

}
```

---


```php, [.highlight: 5]
<?php

// tests/src/Functional/BlogPageTest.php

namespace Drupal\Tests\tdd_blog\Functional;

use Drupal\Tests\BrowserTestBase;

class BlogPageTest extends BrowserTestBase {

  protected static $modules = ['tdd_blog'];

  public function testBlogPageExists() {
    $this->drupalGet('/blog');

    $this->assertSession()->statusCodeEquals(200);
  }

}
```

---


```php, [.highlight: 7-9]
<?php

// tests/src/Functional/BlogPageTest.php

namespace Drupal\Tests\tdd_blog\Functional;

use Drupal\Tests\BrowserTestBase;

class BlogPageTest extends BrowserTestBase {

  protected static $modules = ['tdd_blog'];

  public function testBlogPageExists() {
    $this->drupalGet('/blog');

    $this->assertSession()->statusCodeEquals(200);
  }

}
```

---


```php, [.highlight: 11]
<?php

// tests/src/Functional/BlogPageTest.php

namespace Drupal\Tests\tdd_blog\Functional;

use Drupal\Tests\BrowserTestBase;

class BlogPageTest extends BrowserTestBase {

  protected static $modules = ['tdd_blog'];

  public function testBlogPageExists() {
    $this->drupalGet('/blog');

    $this->assertSession()->statusCodeEquals(200);
  }

}
```

---


```php, [.highlight: 13-17]
<?php

// tests/src/Functional/BlogPageTest.php

namespace Drupal\Tests\tdd_blog\Functional;

use Drupal\Tests\BrowserTestBase;

class BlogPageTest extends BrowserTestBase {

  protected static $modules = ['tdd_blog'];

  public function testBlogPageExists() {
    $this->drupalGet('/blog');

    $this->assertSession()->statusCodeEquals(200);
  }

}
```

---


```bash, [.highlight: 1]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
E                                                                   1 / 1 (100%)

Time: 19.31 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Functional\BlogPageTest::testBlogPageExists
Behat\Mink\Exception\ExpectationException: Current response status code is 404, but 200 expected.

/var/www/vendor/behat/mink/src/WebAssert.php:768
/var/www/vendor/behat/mink/src/WebAssert.php:130
/var/www/web/modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php:13

ERRORS!
Tests: 1, Assertions: 3, Errors: 1.
```

---


```bash, [.highlight: 4]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
E                                                                   1 / 1 (100%)

Time: 19.31 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Functional\BlogPageTest::testBlogPageExists
Behat\Mink\Exception\ExpectationException: Current response status code is 404, but 200 expected.

/var/www/vendor/behat/mink/src/WebAssert.php:768
/var/www/vendor/behat/mink/src/WebAssert.php:130
/var/www/web/modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php:13

ERRORS!
Tests: 1, Assertions: 3, Errors: 1.
```

---


```bash, [.highlight: 5-13]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
E                                                                   1 / 1 (100%)

Time: 19.31 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Functional\BlogPageTest::testBlogPageExists
Behat\Mink\Exception\ExpectationException: Current response status code is 404, but 200 expected.

/var/www/vendor/behat/mink/src/WebAssert.php:768
/var/www/vendor/behat/mink/src/WebAssert.php:130
/var/www/web/modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php:13

ERRORS!
Tests: 1, Assertions: 3, Errors: 1.
```

---


```bash, [.highlight: 14-16]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
E                                                                   1 / 1 (100%)

Time: 19.31 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Functional\BlogPageTest::testBlogPageExists
Behat\Mink\Exception\ExpectationException: Current response status code is 404, but 200 expected.

/var/www/vendor/behat/mink/src/WebAssert.php:768
/var/www/vendor/behat/mink/src/WebAssert.php:130
/var/www/web/modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php:13

ERRORS!
Tests: 1, Assertions: 3, Errors: 1.
```

---


```bash, [.highlight: 18-19]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
E                                                                   1 / 1 (100%)

Time: 19.31 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Functional\BlogPageTest::testBlogPageExists
Behat\Mink\Exception\ExpectationException: Current response status code is 404, but 200 expected.

/var/www/vendor/behat/mink/src/WebAssert.php:768
/var/www/vendor/behat/mink/src/WebAssert.php:130
/var/www/web/modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php:13

ERRORS!
Tests: 1, Assertions: 3, Errors: 1.
```

---

- _The view has not been created_
- Create a new view
- Set the path
- Export the config
- Copy it into the module's `config/install` directory

---


```[.highlight: 11-13]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
E                                                                   1 / 1 (100%)

Time: 16.02 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Functional\BlogPageTest::testBlogPageExists
Drupal\Core\Config\UnmetDependenciesException: Configuration objects provided by <em class="placeholder">tdd_blog</em>
have unmet dependencies: <em class="placeholder">views.view.blog (node.type.article, node, views)</em>

/var/www/web/core/lib/Drupal/Core/Config/UnmetDependenciesException.php:98
/var/www/web/core/lib/Drupal/Core/Config/ConfigInstaller.php:469
/var/www/web/core/lib/Drupal/Core/ProxyClass/Config/ConfigInstaller.php:132
/var/www/web/core/lib/Drupal/Core/Extension/ModuleInstaller.php:145
/var/www/web/core/lib/Drupal/Core/ProxyClass/Extension/ModuleInstaller.php:83
/var/www/web/core/lib/Drupal/Core/Test/FunctionalTestSetupTrait.php:437
/var/www/web/core/tests/Drupal/Tests/BrowserTestBase.php:1055
/var/www/web/core/tests/Drupal/Tests/BrowserTestBase.php:490

ERRORS!
Tests: 1, Assertions: 0, Errors: 1.
```

---


```yml,[.highlight: 1, 7-10]
# tdd_blog.info.yml

name: 'TDD Dublin'
description: 'A demo module to show test driven module development.'
core: 8.x
type: module

dependencies:
  - 'drupal:node'
  - 'drupal:views'
```

---


```[.highlight: 10-13]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
E                                                                   1 / 1 (100%)

Time: 20 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Functional\BlogPageTest::testBlogPageExists
Drupal\Core\Config\UnmetDependenciesException: Configuration objects provided by <em class="placeholder">tdd_blog</em>
have unmet dependencies: <em class="placeholder">views.view.blog (node.type.article)</em>

/var/www/web/core/lib/Drupal/Core/Config/UnmetDependenciesException.php:98
/var/www/web/core/lib/Drupal/Core/Config/ConfigInstaller.php:469
/var/www/web/core/lib/Drupal/Core/ProxyClass/Config/ConfigInstaller.php:132
/var/www/web/core/lib/Drupal/Core/Extension/ModuleInstaller.php:145
/var/www/web/core/lib/Drupal/Core/ProxyClass/Extension/ModuleInstaller.php:83
/var/www/web/core/lib/Drupal/Core/Test/FunctionalTestSetupTrait.php:437
/var/www/web/core/tests/Drupal/Tests/BrowserTestBase.php:1055
/var/www/web/core/tests/Drupal/Tests/BrowserTestBase.php:490

ERRORS!
Tests: 1, Assertions: 0, Errors: 1.
```

---

- Add the article content type

---


```[.highlight: 5, 9]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog
.                                                                   1 / 1 (100%)

Time: 23.36 seconds, Memory: 6.00MB

OK (1 test, 3 assertions)
```

---

[.build-lists: false]

## _Tasks_

- ~~Ensure the blog page exists~~
- Ensure only published articles are shown
- Ensure the articles are shown in the correct order

---

### _Step 3_
## Ensure only published articles are shown

---


```php
public function testOnlyPublishedArticlesAreShown() {
  // Given I have a mixture of published and unpublished articles,
  // as well as other types of content.

  // When I view the blog page.

  // I should only see the published articles.
}
```

---

### _Option 1_
## Functional tests

---


```php,[.highlight: 1, 4-8]
// modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php

public function testOnlyPublishedArticlesAreShown() {
  // Given I have a mixture of published and unpublished articles,
  // as well as other types of content.
  $node1 = $this->drupalCreateNode(['type' => 'page', 'status' => 1]);
  $node2 = $this->drupalCreateNode(['type' => 'article', 'status' => 1]);
  $node3 = $this->drupalCreateNode(['type' => 'article', 'status' => 0]);

  // When I view the blog page.
  $this->drupalGet('/blog');

  // I should only see the published articles.
  $assert = $this->assertSession();
  $assert->pageTextContains($node2->label());
  $assert->pageTextNotContains($node1->label());
  $assert->pageTextNotContains($node3->label());
}
```

^ Different ways to achieve this. This is taking the functional test approach.

---


```php,[.highlight: 10-12]
// modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php

public function testOnlyPublishedArticlesAreShown() {
  // Given I have a mixture of published and unpublished articles,
  // as well as other types of content.
  $node1 = $this->drupalCreateNode(['type' => 'page', 'status' => 1]);
  $node2 = $this->drupalCreateNode(['type' => 'article', 'status' => 1]);
  $node3 = $this->drupalCreateNode(['type' => 'article', 'status' => 0]);

  // When I view the blog page.
  $this->drupalGet('/blog');

  // I should only see the published articles.
  $assert = $this->assertSession();
  $assert->pageTextContains($node2->label());
  $assert->pageTextNotContains($node1->label());
  $assert->pageTextNotContains($node3->label());
}
```

---


```php, [.highlight: 13-17]
// modules/custom/tdd_blog/tests/src/Functional/BlogPageTest.php

public function testOnlyPublishedArticlesAreShown() {
  // Given I have a mixture of published and unpublished articles,
  // as well as other types of content.
  $node1 = $this->drupalCreateNode(['type' => 'page', 'status' => 1]);
  $node2 = $this->drupalCreateNode(['type' => 'article', 'status' => 1]);
  $node3 = $this->drupalCreateNode(['type' => 'article', 'status' => 0]);

  // When I view the blog page.
  $this->drupalGet('/blog');

  // I should only see the published articles.
  $assert = $this->assertSession();
  $assert->pageTextContains($node2->label());
  $assert->pageTextNotContains($node1->label());
  $assert->pageTextNotContains($node3->label());
}
```

---

### _Option 2_
## Kernel tests

---


```php
<?php

namespace Drupal\Tests\tdd_blog\Kernel;

use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;
use Drupal\Tests\node\Traits\NodeCreationTrait;

class BlogPageTest extends EntityKernelTestBase {

  use NodeCreationTrait;

  public static $modules = ['node'];

  public function testOnlyPublishedArticlesAreShown() {
    $this->createNode(['type' => 'page', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 0]);
  }

}
```

^ Kernel test approach
Dropping down a level
No need for the brower, not asserting against HTML
Faster to run

---


```php, [.highlight: 3-8]
<?php

namespace Drupal\Tests\tdd_blog\Kernel;

use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;
use Drupal\Tests\node\Traits\NodeCreationTrait;

class BlogPageTest extends EntityKernelTestBase {

  use NodeCreationTrait;

  public static $modules = ['node'];

  public function testOnlyPublishedArticlesAreShown() {
    $this->createNode(['type' => 'page', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 0]);
  }

}
```

---


```php, [.highlight: 10]
<?php

namespace Drupal\Tests\tdd_blog\Kernel;

use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;
use Drupal\Tests\node\Traits\NodeCreationTrait;

class BlogPageTest extends EntityKernelTestBase {

  use NodeCreationTrait;

  public static $modules = ['node'];

  public function testOnlyPublishedArticlesAreShown() {
    $this->createNode(['type' => 'page', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 0]);
  }

}
```

---


```php, [.highlight: 14-18]
<?php

namespace Drupal\Tests\tdd_blog\Kernel;

use Drupal\KernelTests\Core\Entity\EntityKernelTestBase;
use Drupal\Tests\node\Traits\NodeCreationTrait;

class BlogPageTest extends EntityKernelTestBase {

  use NodeCreationTrait;

  public static $modules = ['node'];

  public function testOnlyPublishedArticlesAreShown() {
    $this->createNode(['type' => 'page', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 1]);
    $this->createNode(['type' => 'article', 'status' => 0]);
  }

}
```

---


```[.highlight: 9-16]
docker@cli:/var/www/web$ ../vendor/bin/phpunit -c core modules/custom/tdd_blog/tests/src/Kernel/
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing modules/custom/tdd_blog/tests/src/Kernel/
E                                                                   1 / 1 (100%)

Time: 6.22 seconds, Memory: 6.00MB

There was 1 error:

1) Drupal\Tests\tdd_blog\Kernel\BlogPageTest::testOnlyPublishedArticlesAreShown
Error: Call to a member function id() on boolean

/var/www/web/core/modules/filter/filter.module:212
/var/www/web/core/modules/node/tests/src/Traits/NodeCreationTrait.php:73
/var/www/web/modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php:13

ERRORS!
Tests: 1, Assertions: 2, Errors: 1.
```

---


```php, [.highlight: 2]
public function testOnlyPublishedArticlesAreShown() {
  $this->installConfig(['filter']);

  $this->createNode(['type' => 'page', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 0]);
}
```

---


```php, [.highlight: 8]
public function testOnlyPublishedArticlesAreShown() {
  $this->installConfig(['filter']);

  $this->createNode(['type' => 'page', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 0]);

  $results = views_get_view_result('blog');
}
```

---


```php, [.highlight: 3]
...

public static $modules = ['node', 'tdd_blog', 'views'];

public function testOnlyPublishedArticlesAreShown() {
  $this->installConfig(['filter', 'tdd_blog']);

  $this->createNode(['type' => 'page', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 0]);

  $results = views_get_view_result('blog');

  $this->assertCount(1, $results);
  $this->assertEquals(2, $results[0]->_entity->id());
}
```

---


```php, [.highlight: 6]
...

public static $modules = ['node', 'tdd_blog', 'views'];

public function testOnlyPublishedArticlesAreShown() {
  $this->installConfig(['filter', 'tdd_blog']);

  $this->createNode(['type' => 'page', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 0]);

  $results = views_get_view_result('blog');

  $this->assertCount(1, $results);
  $this->assertEquals(2, $results[0]->_entity->id());
}
```

---


```php, [.highlight: 8-15]
...

public static $modules = ['node', 'tdd_blog', 'views'];

public function testOnlyPublishedArticlesAreShown() {
  $this->installConfig(['filter', 'tdd_blog']);

  $this->createNode(['type' => 'page', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 1]);
  $this->createNode(['type' => 'article', 'status' => 0]);

  $results = views_get_view_result('blog');

  $this->assertCount(1, $results);
  $this->assertEquals(2, $results[0]->_entity->id());
}
```

^ Assert
Should only be one result, should be node 2
Node IDs are reset on each test method

---


```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/custom/tdd_blog/tests/src/Kernel
F                                                                   1 / 1 (100%)

Time: 2.16 seconds, Memory: 6.00MB

There was 1 failure:

1) Drupal\Tests\tdd_blog\Kernel\BlogPageTest::testOnlyPublishedArticlesAreShown
Failed asserting that actual size 3 matches expected size 1.

/Users/opdavies/Code/drupal-testing-workshop/web/modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php:23

FAILURES!
Tests: 1, Assertions: 4, Failures: 1.
```

---


```[.highlight: 8-13]
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/custom/tdd_blog/tests/src/Kernel
F                                                                   1 / 1 (100%)

Time: 2.16 seconds, Memory: 6.00MB

There was 1 failure:

1) Drupal\Tests\tdd_blog\Kernel\BlogPageTest::testOnlyPublishedArticlesAreShown
Failed asserting that actual size 3 matches expected size 1.

/Users/opdavies/Code/drupal-testing-workshop/web/modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php:23

FAILURES!
Tests: 1, Assertions: 4, Failures: 1.
```

---

>- _There are no filters on the view_
- Add the filters
- Export and save the view

---

```[.highlight: 3-8]
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/custom/tdd_blog/tests/src/Kernel
.                                                                   1 / 1 (100%)

Time: 2.02 seconds, Memory: 6.00MB

OK (1 test, 6 assertions)
```

---

[.build-lists: false]

## _Tasks_

- ~~Ensure the blog page exists~~
- ~~Ensure only published articles are shown~~
- Ensure the articles are shown in the correct order

---

### _Step 4_
## Ensure the articles are ordered by date

---


```php
// modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php

public function testArticlesAreOrderedByDate() {
  // Given that I have numerous articles with different post dates.

  // When I go to the blog page.

  // The articles are ordered by post date.
}
```

---


```php, [.highlight: 4-9]
// modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php

public function testArticlesAreOrderedByDate() {
  // Given that I have numerous articles with different post dates.
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 day')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 month')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+3 days')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 hour')->getTimestamp()]);

  // When I go to the blog page.

  // The articles are ordered by post date.
}
```

---

```php
$this->createNode([
  'type' => 'article',
  'created' => (new \DateTime())->modify('+1 day')->getTimestamp(),
]);
```

^ Array of default values

---


```php, [.highlight: 10-11]
// modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php

public function testArticlesAreOrderedByDate() {
  // Given that I have numerous articles with different post dates.
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 day')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 month')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+3 days')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 hour')->getTimestamp()]);

  // When I go to the blog page.
  $results = views_get_view_result('blog');

  // The articles are ordered by post date.
}
```

---


```php, [.highlight:10-15]
// modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php

public function testArticlesAreOrderedByDate() {
  // Given that I have numerous articles with different post dates.
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 day')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 month')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+3 days')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 hour')->getTimestamp()]);

  // When I go to the blog page.
  $results = views_get_view_result('blog');

  $nids = array_map(function(ResultRow $result) {
    return $result->_entity->id();
  }, $results);

  // The articles are ordered by post date.
}
```

---


```php, [.highlight: 5-9, 17-18]
// modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php

public function testArticlesAreOrderedByDate() {
  // Given that I have numerous articles with different post dates.
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 day')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 month')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+3 days')->getTimestamp()]);
  $this->createNode(['type' => 'article', 'created' => (new \DateTime())->modify('+1 hour')->getTimestamp()]);

  // When I go to the blog page.
  $results = views_get_view_result('blog');

  $nids = array_map(function(ResultRow $result) {
    return $result->_entity->id();
  }, $results);

  // The articles are ordered by post date.
  $this->assertEquals([4, 1, 3, 2], $nids);
}
```

---


```
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/custom/tdd_blog/tests/src/Kernel
F                                                                   1 / 1 (100%)

Time: 1.42 seconds, Memory: 6.00MB

There was 1 failure:

1) Drupal\Tests\tdd_blog\Kernel\BlogPageTest::testArticlesAreOrderedByDate
Failed asserting that two arrays are equal.
--- Expected
+++ Actual
@@ @@
 Array (
-    0 => 4
-    1 => 1
-    2 => 3
-    3 => 2
+    0 => '3'
+    1 => '2'
+    2 => '4'
+    3 => '1'

/Users/opdavies/Code/drupal-testing-workshop/web/core/tests/Drupal/KernelTests/KernelTestBase.php:1114
/Users/opdavies/Code/drupal-testing-workshop/web/modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php:43

FAILURES!
Tests: 1, Assertions: 4, Failures: 1.
```

---

[.text: comic sans]

```[.highlight: 8-26]
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/custom/tdd_blog/tests/src/Kernel
F                                                                   1 / 1 (100%)

Time: 1.42 seconds, Memory: 6.00MB

There was 1 failure:

1) Drupal\Tests\tdd_blog\Kernel\BlogPageTest::testArticlesAreOrderedByDate
Failed asserting that two arrays are equal.
--- Expected
+++ Actual
@@ @@
 Array (
-    0 => 4
-    1 => 1
-    2 => 3
-    3 => 2
+    0 => '3'
+    1 => '2'
+    2 => '4'
+    3 => '1'

/Users/opdavies/Code/drupal-testing-workshop/web/core/tests/Drupal/KernelTests/KernelTestBase.php:1114
/Users/opdavies/Code/drupal-testing-workshop/web/modules/custom/tdd_blog/tests/src/Kernel/BlogPageTest.php:43

FAILURES!
Tests: 1, Assertions: 4, Failures: 1.
```

---

- _There is no sort order defined on the view_
- Add the sort order
- Re-export the view

---

```[.highlight:3-8]
PHPUnit 6.5.8 by Sebastian Bergmann and contributors.

Testing web/modules/custom/tdd_blog/tests/src/Kernel
.                                                                   1 / 1 (100%)

Time: 1.74 seconds, Memory: 6.00MB

OK (1 test, 5 assertions)
```

---

[.build-lists: false]

## _Tasks_

- ~~Ensure the blog page exists~~
- ~~Ensure only published articles are shown~~
- ~~Ensure the articles are shown in the correct order~~

---

[.header: alignment(center)]

# Questions?

---

[.header: alignment(center)]

# Thanks
### _@opdavies_
### _oliverdavies.uk_
