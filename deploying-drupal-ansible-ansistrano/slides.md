theme: poster, 8
autoscale: true
build-lists: true
header-emphasis: #53B0EB
header: alignment(left)
text: alignment(left)
text-emphasis: #53B0EB
code: Monaco, line-height(1.2)

[.header: alignment(center)]


# [fit] Deploying PHP applications
# [fit] _With Ansible, Ansible Vault and Ansistrano_

---

[.background-color: #FFFFFF]
[.build-lists: false]
[.header: #111111]
[.text: #111111, alignment(left)]

![right 800%](../images/me-phpnw.png)

- Full Stack Web Developer & System Administrator
- Senior Developer at Microserve
- Part-time freelancer
- Acquia certified Drupal 8 Grand Master
- Drupal 7 & 8 core contributor
- Symfony, Laravel, Sculpin
- @opdavies
- www.oliverdavies.uk

^ Work at Microserve.
Maintain Drupal modules, PHP CLI tools and libraries
Blog on my website

---

[.background-color: #FFFFFF]
[.build-lists: false]
[.text: #111111, alignment(left)]

![right 100%](../images/microserve-light.png)

- https://microserve.io
- https://www.drupal.org/microserve
- https://github.com/microserve-io
- https://twitter.com/microserveltd
- https://www.linkedin.com/company/microserve-ltd

---

[.header: #FFFFFF, line-height(0.7), League Gothic]

### _Things we'll be_
# Looking at

---

[.background-color: #FFFFFF]


![10%](images/ansible.png)
![85%](images/vagrant.png)
![325%](images/druplicon.png)
![325%](images/composer.png)

^ Ansible - software provisioning and deployment tool
Vagrant - used for managing virtual machines. Used instead of a real server
Drupal
Composer - required by Drupal 8 to pull in dependencies (e.g. Symfony)

---

1. Ansible crash course
1. Initial setup and provisioning
1. Basic deployment setup
1. Using Ansible Vault for variables
1. Adding and configuring Ansistrano

---

[.background-color: #FFFFFF]
[.text: #111111, alignment(left)]

## When should I use this?

* Dedicated hosting: probably has this already
* Shared hosting: probably not flexible enough
* VPS or dedicated server

---

### _What is_
# Ansible?

---

[.background-color: #FFFFFF]
[.text: #111111]
[.footer: https://en.wikipedia.org/wiki/Ansible_(software)]

Ansible is _open source software_<br>that automates _software provisioning_, <br>_configuration management_, <br>and _application deployment_.

---

[.background-color: #FFFFFF]
[.text: #111111, alignment(left)]

![10% right](images/ansible.png)

# What is Ansible?

* YAML
* Batteries included
* Executes remote commands
* Installs software packages
* Performs deployment steps

---

[.background-color: #FFFFFF]
[.text: #111111, alignment(left)]

![10% right](images/ansible.png)

# What is Ansible?

* Hosts
* Commands
* Playbooks
* Tasks
* Roles

---


[.background-color: #FFFFFF]
[.text: #111111, alignment(left)]

![10% right](images/ansible.png)

# Why Ansible?

* Familiar syntax
* Easily readable
* No server dependencies
* Easy to add to an existing project
* Includes relevant modules (e.g. Composer)

---

### _Ansible_
# Hosts

---

```ini
# hosts.ini

[dransible]
192.168.33.10
```

---

### _Ansible_
# Commands

---

```
ansible all -m ping

ansible all -m command -a 'git pull --chdir=/var/www/app'
```

---

### _Ansible_
# [fit] Tasks and Playbooks

---

```yaml
# playbook.yml

---
- hosts: all

  tasks:
    - name: Update the code
      command: git pull
        args:
            chdir: /var/www/app
```

---

```
ansible-playbook playbook.yml -i hosts.ini
```

---

### _Ansible_
# Roles

^ Collections of tasks, variables and handlers

---

```yaml
# requirements.yml

---
- src: geerlingguy.apache
- src: geerlingguy.composer
- src: geerlingguy.mysql
- src: geerlingguy.php
- src: geerlingguy.php-mysql
```

---

```
ansible-galaxy -r ansible/requirements.yml install
```

---

```yaml
# playbook.yml

---
- hosts: all

  roles:
    - geerlingguy.apache
    - geerlingguy.mysql
    - geerlingguy.php
    - geerlingguy.php-mysql
    - geerlingguy.composer
```

^ Role order matters!

---

[.header: alignment(center)]

## Let's take a look <br>at the code

---

### _Basic deployment_
# Ansible

^ Any questions on Ansible so far?

---

```yaml
# ansible/provision.yml

tasks:
  - name: Create a database
    mysql_db:
      name: mydatabase
      state: present

  - name: Add the database user
    mysql_user:
      name: drupal
      password: secret
      priv: '*.*:ALL'
      state: present
```

---

```yaml
# ansible/deploy.yml

tasks:
  - name: Creating project directory
    file:
      path: /var/www/app
      state: directory

  - name: Uploading application
    synchronize:
      src: "{{ playbook_dir }}/../"
      dest: /var/www/app

  - name: Installing Composer dependencies
    composer:
      command: install
      working_dir: /var/www/app
```

---

[.background-color: #FFFFFF]
[.text: #111111, alignment(left)]

# Disadvantages

* Single point of failure
* No ability to roll back
* Sensitive data stored in plain text

---

### _Keeping secrets_
# Ansible Vault

---

```bash
ansible-vault create ansible/vault.yml
```

---

```
$ANSIBLE_VAULT;1.1;AES256
36656233323539616336393838396137343939623233393338666530313730373233663263633065
3133633335316364306366333539613936376239383133330a356365666232623537333730663638
37393264616134613163663762666464373733663737383039316163336263323538393533323266
3432346662613438330a386435393432323761386137333736363436386466643031386662353933
30393631386463313265653862633866663530626439623063393934653235666530656462643135
39366431353762383434663536663761323565616564336131666339653038326333306433326264
31623539643166626234663736656337633036323837333137343533386165366531626462643662
66626631663930626266653937323634366231326537626131663662396335393361336635373736
3435
```

---

```yaml
# ansible/vars/vault.yml

---
vault_app_db_name: mydatabase
vault_app_db_user: drupal
vault_app_db_password: secret
```

^ Optional, but easier to see where variables are set

---

```yaml
# ansible/vars/vars.yml

---
app_db_name: "{{ vault_app_db_name }}"
app_db_user: "{{ vault_app_db_user }}"
app_db_password: "{{ vault_app_db_password }}"
```

---

```yaml
# ansible/provision.yml

tasks:
  - name: Create a database
    mysql_db:
      name: '{{ app_db_name }}'
      state: present
```

---

```bash
ansible-vault edit ansible/vault.yml
```

---

### _Better deployments_
# Ansistrano

---

![full inline](images/ansistrano.png)

^ Just another role, specifically for deployments
Ansible port of Capistrano

---

[.background-color: #FFFFFF]
[.text: #111111, alignment(center)]

Capistrano is an open-source tool for running scripts on multiple servers; its main use is deploying web applications. <br><br><br>It automates the process of making a new version of an application available on one or more web servers, including supporting tasks such as changing databases.

---

[.background-color: #FFFFFF]
[.text: #111111, alignment(left)]

# Features

* Multiple release directories
* Shared paths and files
* Customisable
* Multiple deployment strategies
* Multi-stage environments
* Prune old releases
* Rollbacks

^ rsync, Git, SVN etc

---

```yaml
# ansible/requirements.yml

---
...
- ansistrano.deploy
- ansistrano.rollback
```

---

```yaml
# ansible/deploy.yml

---
- hosts: all

  roles:
    - ansistrano.deploy
```

---

```yaml
# ansible/deploy.yml

---
  ...
  vars:
    ansistrano_deploy_to: /var/www
    ansistrano_deploy_via: git
    ansistrano_git_branch: master
    ansistrano_git_repo: 'git@github.com:foo/bar.git'
```

---

```yaml
# ansible/rollback.yml

---
- hosts: all

  roles:
    - ansistrano.rollback

  vars:
    ansistrano_deploy_to: /var/www
```

---

### _Customising Ansistrano_
# Build Hooks

---

[.background-color: #FFFFFF]

![inline 125%](images/ansistrano-flow.png)

---

```yaml
# ansible/deploy.yml

vars:
  ...
  ansistrano_after_symlink_shared_tasks_file: "{{ playbook_dir }}/deploy/after-symlink-shared.yml"
  ansistrano_after_symlink_tasks_file: "{{ playbook_dir }}/deploy/after-symlink.yml"
  ansistrano_after_update_code_tasks_file: "{{ playbook_dir }}/deploy/after-update-code.yml"

  release_web_path: "{{ ansistrano_release_path.stdout }}/web"
  release_drush_path: "{{ ansistrano_release_path.stdout }}/vendor/bin/drush"
```

---

```yaml
# ansible/deploy/after-symlink-shared.yml

---
- name: Run database updates
  command: '{{ release_drush_path }} --root {{ release_web_path }} updatedb'
```

---

```yaml
# ansible/deploy/after-update-code.yml

---
- name: Install Composer dependencies
  composer:
    command: install
    working_dir: '{{ ansistrano_release_path.stdout }}'
```

---

```yaml
# ansible/deploy/after-symlink.yml

---
- name: Clear Drupal cache
  command: '{{ release_drush_path }} --root {{ release_web_path }} cache-rebuild'
```

---

[.header: alignment(center)]

# Questions?

---

[.header: alignment(center)]

# Thanks
### _@opdavies_
### _oliverdavies.uk_
