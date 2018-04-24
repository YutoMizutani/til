## sample

### create html
```
$ vi index.html
```

```html
<html>
hello from ansible!
</html>
```

### create php
```
$ vi hello.php
```

```php
<?php

echo "hello from PHP!";
```

### create ansible

```yaml
---
- hosts: all
  sudo: yes
  vars_prompt:
    username: "Enter username"
  tasks:
    - name: add a new user
      user: name={{username}}
    - name: install libselinux-python
      yum: name=libselinux-python state=latest

- hosts: web
  sudo: yes
  tasks:
    - name: install apache
      yum: name=httpd state=latest
    - name: start apache and enabled
      service: name=httpd state=started enabled=yes
    - name: change owner
      file: dest=/var/www/html owner=vagrant recurse=yes
    - name: copy index.html
      copy: src=./index.html dest=/var/www/html/index.html owner=vagrant
    - name: install php packages
      yum: name={{item}} state=latest
      with_items:
        - php 
        - php-devel
        - php-mbstring
        - php-mysql
      notify:
        - restart apache
    - name: copy hello.php
      copy: src=./hello.php dest=/var/www/html/hello.php owner=vagrant
  handlers: 
    - name: restart apache
      service: name=httpd state=restarted

- hosts: db
  sudo: yes
  tasks: 
    - name: install mysql
      yum: name={{item}} state=latest
      with_items:
        - mysql-server
        - MySQL-python
    - name: start mysql and enabled
      service: name=mysqld state=started enabled=yes
    - name: create a database
      mysql_db: name=mydb state=present
    - name: create a user for mydb
      mysql_user: name=dbuser password=dbpassword priv=mydb.*:ALL state=present
```

```yaml
---
- hosts: all
  sudo: yes
  tasks:
    - name: add a new user
      user: name=ym
    - name: install libselinux-python
      yum: name=libselinux-python state=latest

- hosts: web
  sudo: yes
  tasks:
    - name: install apache
      yum: name=httpd state=latest
    - name: start apache and enabled
      service: name=httpd state=started enabled=yes
    - name: change owner
      file: dest=/var/www/html owner=vagrant recurse=yes
    - name: copy index.html
      copy: src=./index.html dest=/var/www/html/index.html owner=vagrant
    - name: install php packages
      yum: name={{item}} state=latest
      with_items:
        - php 
        - php-devel
        - php-mbstring
        - php-mysql
      notify:
        - restart apache
    - name: copy hello.php
      copy: src=./hello.php dest=/var/www/html/hello.php owner=vagrant
  handlers: 
    - name: restart apache
      service: name=httpd state=restarted

- hosts: db
  sudo: yes
  tasks: 
    - name: install mysql
      yum: name={{item}} state=latest
      with_items:
        - mysql-server
        - MySQL-python
    - name: start mysql and enabled
      service: name=mysqld state=started enabled=yes
    - name: create a database
      mysql_db: name=mydb state=present
    - name: create a user for mydb
      mysql_user: name=dbuser password=dbpassword priv=mydb.*:ALL state=present
```