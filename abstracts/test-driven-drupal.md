---
title: TDD - Test Driven Drupal
url: https://www.oliverdavies.uk/talks/tdd-test-driven-drupal
tags: [drupal, drupal-8, testing, php]
---

Testing is important. Why? It allows developers to add new features and edit and
refactor existing code without the worry of adding regressions, reduces the
reliance on manual testing to discover bugs, and by taking a test driven
approach, your implementation code is leaner as you only write what is needed
for your tests to pass.

Drupal 7 includes the SimpleTest module for unit and functional testing, whilst
Drupal 8 also includes and supports PHPUnit - the defacto PHP testing framework,
used by other PHP projects including Symfony and Laravel - making it easier for
people to test their code. And with testing being one of the Drupal core gates
with tests needing to be included with every new feature or bug fix, and core’s
100% pass rate policy, testing has become an essential skill when contributing
to core, or when working on your own projects.

In this talk, we’ll cover the methodology and terminology involved with
automated testing, and then take a test driven approach to creating a new Drupal
module.
