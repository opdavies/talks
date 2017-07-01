autoscale: true
build-lists: true
footer: @opdavies | oliverdavies.uk
theme: next, 8

[.hide-footer]

# Deploying PHP applications
# (and anything else)
# with Fabric

---

[.build-lists: false]
[.autoscale: false]

## opdavies

- Web Developer and System Administrator
- Drupal, Symfony, Laravel, Silex, Sculpin
- Senior Developer at Microserve
- Part-time freelancer
- Open source maintainer and contributor

---

## What and Why?

- Python library, CLI tool
- Runs commands and local and remote hosts
- Flexible
- Combine pre-deploy and post-deploy scripts

---

[.hide-footer]

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

[.hide-footer]

# Basic fabfile

```python
from fabric.api import *

env.hosts = ['example.com']
env.use_ssh_config = True

def build():
  with cd('/var/www/html'):
    run('git pull')
    run('composer install')
```
---

## Running Tasks

[.hide-footer]

```bash
$ fab <task>

# Specify a path and filename to the fabfile.
$ fab <task> --fabfile=/path/to/fabfile

# Pass arguments into the task.
$ fab <task>:build_type=drupal,foo=bar
```

^ fabfile.py in the current directory is found automatically.

---

[.hide-footer]

## Running Tasks Locally

```python
from fabric.api import *

...

def build():
  local('git pull')
  local('composer install')
```

---

[.hide-footer]

## Building Front-End Assets

```python
def build_assets(env):
  with lcd('themes/custom/example'):
    local('yarn --pure-lockfile')
    local('./node_modules/.bin/bower install')

    if env == 'prod':
      local('./node_modules/.bin/gulp --production')
    else:
      local('./node_modules/.bin/gulp')
```

^ lcd = change directory locally

---

[.hide-footer]

## Pushing the Code

```python
from fabric.contrib.project import rsync_project

...

def deploy():
  rsync_project(
    local_dir='./',
    remote_dir='/var/www/html'
    exclude=('.git', 'node_modules/'),
    default_opts='-vzcrSLh'
  )
```

---

## More...

- Run Drush/Console/Artisan commands
- Ensure correct file ownership and permissions
- Update symlinks
- Restart Nginx/Apache
- Anything you can do from the command line...

---

## Questions?
