autoscale: true
build-lists: true
theme: poster, 7

# [fit] *Deploying* PHP<br>applications<br>*with* Fabric

---

[.build-lists: false]

- What is Fabric and what do I use it for?
- How to write and organise Fabric scripts
- Task examples

---

[.build-lists: false]

- Senior Developer at Microserve
- Part-time freelance Developer & Sysadmin
- Drupal Bristol, PHPSW, DrupalCamp Bristol
- @opdavies
- oliverdavies.uk

![right](../../me-microserve.jpg)

^ Drupal (7 & 8), Symfony, Silex, Laravel, Sculpin
Not a Python Developer

---

## *What is* Fabric*?*

---

## What is Fabric?

*Fabric is a* Python (2.5-2.7) library and command-line tool for streamlining the use of SSH *for application deployment or systems administration tasks.*

---

## What is Fabric?

It provides a basic suite of operations for executing local or remote shell commands (normally or via sudo) and uploading/downloading files, as well as auxiliary functionality such as prompting the running user for input, or aborting execution.

---

## I use Fabric to...

- Simplify my build process
- Deploy code directly to different environments
- Act as an intermediate step

---

![fit](images/files.png)

---

[.build-lists: false]

## Why Fabric?

- Powerful
- Flexible
- Easier to write than bash

^ - Can be used for different languages, frameworks
- Can be used for small, simple deployments or large, complicated ones
- Not very opinioned

---

## Installing Fabric

```bash
$ pip install fabric

# macOS
$ brew install fabric

# Debian, Ubuntu
$ apt-get install fabric
$ apt-get install python-fabric
```

---

## Writing your <br>first *fabfile*

---

```python
# fabfile.py

from fabric.api import env, run, cd, local

env.hosts = ['example.com']

# Do stuff...
```

^ Callables

---

```python
# fabfile.py

from fabric.api import *

env.hosts = ['example.com']

# Do stuff...
```

---

## Operations

- cd, lcd - *change directory*
- run, sudo, local - *run a command*
- get - *download files*
- put - *upload files*

[.footer: http://docs.fabfile.org/en/1.13/api/core/operations.html]

---

## Utils

- warn: *print warning message*
- abort: *abort execution, exit with error status*
- error: *call func with given error message*
- puts: *alias for print whose output is managed by Fabric's output controls*

[.footer: http://docs.fabfile.org/en/1.13/api/core/utils.html]

---

## File management

```python
from fabric.contrib.files import *
```

- exists - *check if path exists*
- contains - *check if file contains text/matches regex*
- sed - *run search and replace on a file*
- upload_template - *render and upload a template to remote host*

[.footer: http://docs.fabfile.org/en/1.13/api/contrib/files.html#fabric.contrib.files.append]

^ Allows for jinja2 templates

---

## Tasks

```python

def build():
    with cd('/var/www/html'):
        run('git pull')
        run('composer install')
```

---

## Task arguments

```python, [.highlight: 1, 4-6]
def build(run_composer=True):
    with cd('/var/www/html'):
        run('git pull')

        if run_composer:
            run('composer install')
```

---

## Task arguments

```python, [.highlight: 1, 4-15]
def build(run_composer=True, env='prod', build_type):
    with cd('/var/www/html'):
        run('git pull')

        if run_composer:
            if env == 'prod':
                run('composer install --no-dev')
            else:
                run('composer install')

        if build_type == 'drupal':
            ...
        elif build_type == 'symfony':
            ...
        elif build_type == 'sculpin':
            ...
```

---

## Calling other tasks

```python, [.highlight: 4-15]
@task
def build():
    with cd('/var/www/html'):
        build()
        post_install()

def build():
    run('git pull')
    run('composer install')

def post_install():
    with prefix('drush'):
        run('updatedb -y')
        run('entity-updates -y')
        run('cache-rebuild')
```

^ Better organised code
Not everything in one long
Easier to read and comprehend
Single responsibilty principle

---

## Running Tasks

```bash
fab --list

fab <task>

fab <task>:build_number=$BUILD_ID,build_type=drupal
```

^ fabfile.py in the current directory is found automatically.

---

```
[production] Executing task 'main'
[production] run: git pull
[production] out: Already up-to-date.
[production] out:

[production] run: composer install
...
[production] out: Generating autoload files
[production] out:

Done.
Disconnecting from production... done.
```

---

## Downsides

- Running build tasks on production

---

[.build-lists: false]

## *Not* Building on Prod

1. Build locally and deploy.

---

## Local tasks

```python
# Runs remotely.

from fabric.api import run

run('git pull')
run('composer install')

# Runs locally.

from fabric.api import local

local('git pull')
local('composer install')
```

---

## Local tasks

```python
# Remote.

from fabric.api import cd

with cd('themes/custom/drupalbristol'):
    ...

# Runs locally.

from fabric.api import lcd

with lcd('themes/custom/drupalbristol'):
    ...
```

---

## rsync

```python, [.highlight: 1, 5-11]
from fabric.contrib.project import rsync_project

...

def deploy():
    rsync_project(
        local_dir='./',
        remote_dir='/var/www/html'
        default_opts='-vzcrSLh',
        exclude=('.git', 'node_modules/', '.sass-cache/')
    )
```

---

```
[production] Executing task 'main'
[localhost] local: git pull
Current branch master is up to date.
[localhost] local: composer install
Loading composer repositories with package information
Installing dependencies (including require-dev) from lock file
Nothing to install or update
Generating autoload files

Done.
```

^ - The risky steps have been run separate to the live code.
- Any issues will not affect the live site.

---

[.build-lists: false]

## *Not* Building on Prod

1. ~~Build locally and deploy.~~
1. Build in a separate directory and switch after build.

^ Capistrano

---

## Deploying into a *different directory*

```python
from fabric.api import *
from time import time

project_dir = '/var/www/html'
next_release = "%(time).0f" % { 'time': time() } # timestamp

def init():
    if not exists(project_dir):
        run('mkdir -p %s/backups' % project_dir)
        run('mkdir -p %s/shared' % project_dir)
        run('mkdir -p %s/releases' % project_dir)
```

---

## Deploying into a *different directory*

```python
current_release = '%s/%s' % (releases_dir, next_release)

run('git clone %s %s' % (git_repo, current_release))

def build():
    with cd(current_release):
        pre_tasks()
        build()
        post_tasks()
```

^ - Clone the repository into a different directory
- Run any "risky" tasks away from the production code

---

## Deploying into a *different directory*

```python
def pre_build(build_number):
    with cd('current'):
        print '==> Dumping the DB (just in case)...'
        backup_database()

def backup_database():
    cd('drush sql-dump --gzip > ../backups/%s.sql.gz' % build_number)
```

---

## Deploying into a *different directory*

```python
def update_symlinks():
    run('ln -nfs %s/releases/%s %s/current'
    % (project_dir, next_release, project_dir))

# /var/www/html/current
```

---

```
[production] Executing task 'main'
[production] run: git clone https://github.com/opdavies/oliverdavies.uk.git
  /var/www/html/releases/1505865600
===> Installing Composer dependencies...
[production] run: composer install --no-dev
===> Update the symlink to the new release...
[production] run: ln -nfs /var/www/html/releases/1505865600
  /var/www/html/current

Done.
```

---

```bash
# /var/www/html

shared
releases/1502323200
releases/1505692800
releases/1505696400
releases/1505865600
current -> releases/1505865600 # symlink
```

---

## Positives

- Errors happen away from production

## Downsides

- Lots of release directories

---

## Removing old builds

```python
def main(builds_to_keep=3):
  with cd('%s/releases' % project_dir):
    run("ls -1tr | head -n -%d | xargs -d '\\n' rm -fr"
    % builds_to_keep)
```

^ - Find directory names
- 1tr not ltr
- Remove the directories
- Additional tasks, removing DB etc

---

## Is the site still running?

---

## Checking for failures

```python
run(command).failed:
    # Fail

run(command).return_code == 0:
    # Pass

run(command).return_code == 1:
    # Fail
```

^ Works for local and remote.

---

```python
def post_tasks():
    print '===> Checking the site is alive.'
    if run('drush status | egrep "Connected|Successful"').failed:
        # Revert back to previous build.
```

---

```bash, [.highlight 3]
$ drush status

Drupal version                  :  8.3.7
Site URI                        :  http://default
Database driver                 :  mysql
Database hostname               :  db
Database username               :  user
Database name                   :  default
Database                        :  Connected
Drupal bootstrap                :  Successful
Drupal user                     :
Default theme                   :  bartik
Administration theme            :  seven
PHP configuration               :  /etc/php5/cli/php.ini
...
```

^ "Database" to "PHP configuration" missing if cannot connect.

---

## Does the code still merge cleanly?

^ Pre-task

---

```python
def check_for_merge_conflicts(target_branch):
    with settings(warn_only=True):
        print('===> Ensuring that this can be merged into the main branch.')

        if local('git fetch && git merge --no-ff origin/%s' % target_branch).failed:
            abort('Cannot merge into target branch.')
```

---

![](images/homer-smart.png)

## Making fabric smarter

---

## Conditional variables

```python
drupal_version = None

if exists('composer.json') and exists('core'):
    drupal_version = 8
else:
    drupal_version = 7
```

---

## Conditional tasks

```python
if exists('composer.json'):
    run('composer install')

with cd('themes/custom/example'):
    if exists('package.json') and not exists('node_modules'):
        run('yarn --pure-lockfile')

    if exists('gulpfile.js'):
        run('node_modules/.bin/gulp --production')
    elif exists('gruntfile.js'):
        run('node_modules/.bin/grunt build')
```

---

## Project settings file

```yml
# app.yml

drupal:
    version: 8
    root: web
    config:
        import: yes
        name: sync
        cmi_tools: no
    theme:
        path: 'themes/custom/drupalbristol'
        build:
            npm: no
            type: gulp
            yarn: yes

composer:
    install: true
```

---

## Project settings file

```python, [.highlight 3]
# fabfile.py

from fabric.api import *
import yaml

with open('app.yml', 'r') as file:
    config = yaml.load(file.read())
```

---

## Project settings file

```python
# fabfile.py

if config['composer']['install'] == True:
    local('composer install')
```

---

## Project settings file

```python
# fabfile.py

if build_type == 'drupal':
    drupal = config['drupal']

    with cd(drupal['root']):
        if drupal['version'] == 8:
            if drupal['config']['import'] == True:
                if drupal['config']['cmi_tools']:
                    run('drush cim -y %s' % drupal['config']['import']['name'])
                else:
                    run('drush cimy -y %s' % drupal['config']['import']['name'])

        if drupal['version'] == 7:
            ...
```

^ - Less hard-coded values
- More flexible
- No need to use different files for different versions or frameworks
- No forked fabfiles per project or lots of conditionals based on the project

---

## Project settings file

```python
theme = config['theme']

with cd(theme['path']):
    if theme['build']['gulp'] == True:
        if env == 'prod':
            run('node_modules/.bin/gulp --production')
        else:
            run('node_modules/.bin/gulp')
```

---

## Project settings file v2

```yml
# app.yml

commands:
    build: |
        cd web/themes/custom/drupalbristol
        yarn --pure-lockfile
        node_modules/.bin/gulp --production

    deploy: |
        cd web
        drush cache-rebuild -y
```

---

## Project settings file v2

```python
# fabfile.py

for hook in config['commands'].get('build', '').split("\n"):
    run(hook)

...

for hook in config['commands'].get('deploy', '').split("\n"):
    run(hook)
```

---

## Other things

- Run Drush/console/artisan commands
- Verify file permissions
- Restart services
- Anything you can do on the command line...

---

[.build-lists: false]

## Fabric has...

- Simplified my build process
- Made my build process more flexible
- Made my build process more robust

---

[.build-lists: false]

- https://www.oliverdavies.uk/talks/deploying-php-fabric
- http://fabfile.org
- https://github.com/opdavies/fabric-example-sculpin
- https://github.com/opdavies/fabric-example-drupal
- https://deploy.serversforhackers.com (~~$129~~ $79)

---

## *joind.in/talk/*4e35d

---

## @opdavies
## *oliverdavies.uk*
