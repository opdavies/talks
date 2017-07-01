# Getting (Your Data) into Drupal 8

If you’ve moved a site from Drupal 6 to 7, the chances are that you’ve either used the upgrade path to update your old site in-place, or you built a new site from scratch and used the Migrate module from contrib to migrate your data from the old database.

In Drupal 8, things have changed as there’s no upgrade path from Drupal 7 and the Migrate module has been moved into core, though there are still migration related modules available in contrib.

This talk will look at the core Migrate module and how it implements Drupal 8 features such as YAML and the plugin and configuration systems, and how to write your own migrations to get your data into Drupal 8.
