---
title: Having Fun with Drupal 8, PHP libraries and the Drupal.org API
url: https://www.oliverdavies.uk/talks/drupal-8-php-libraries-drupalorg-api
tags: [drupal, drupal-8, php, composer]
---
Recently whilst I was involved in rebuilding an agency website, I started looking for a way to list our supported contrib projects from Drupal.org including information such as each project’s download and star count - similar to how I’d seen on other websites for their PHP projects on GitHub.

This led me down a path of modern PHP development practices - firstly developing a separate PHP library for interacting with Drupal.org, and then writing a custom Drupal module that allowed the library to be configurable, as well as making use of Drupal’s user roles and permissions, routing and caching.

I then also found another use-case for this library, to display the Drupalversary date for a user - i.e. when they created their account on Drupal.org - and to display a message if the current day was a user's Drupalversary.

In this talk, I explain the approach that I took and some and the benefits of splitting code into separate packages, I'll demo the library itself before moving on to look at the code for and demo the Drupal modules that leverage it.
