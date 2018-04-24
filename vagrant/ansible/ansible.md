## Use ansible

## Add vagrant
- Refetences
	- [https://app.vagrantup.com/boxes/search](https://app.vagrantup.com/boxes/search)

```
$ vagrant init bento/centos-6.8
$ vi Vagrantfile
```

Edit Vagrantfile, 

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "bento/centos-6.8"
  config.vm.define "host" do |node|
    node.vm.box = "bento/centos-6.8"
    node.vm.hostname = "host"
    node.vm.network :private_network, ip: "192.168.43.51"
  end

  config.vm.define "web" do |node|
  node.vm.box = "bento/centos-6.8"
    node.vm.hostname = "web"
    node.vm.network :private_network, ip: "192.168.43.52"
  end

  config.vm.define "db" do |node|
  node.vm.box = "bento/centos-6.8"
    node.vm.hostname = "db"
    node.vm.network :private_network, ip: "192.168.43.53"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end

```

```
$ vagrant up
```

### Install Ansible
- References
	- [https://dl.fedoraproject.org/pub/epel/6/x86_64/](https://dl.fedoraproject.org/pub/epel/6/x86_64/)

```
$ vagrant ssh host
$ wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
$ sudo rpm -Uvh epel-release-6-8.noarch.rpm
$ sudo yum -y install ansible
$ ansible --version
```

### Set ssh
It will connect web and db using `ssh (name)`,

```
$ vi .ssh/config
```

Edit config, 

```
Host web
 HostName 192.168.43.52
Host db
 HostName 192.168.43.53
```

```
$ chmod 600 .ssh/config
$ ssh-keygen -t rsa
$ ssh-copy-id web
$ ssh web
$ exit
$ ssh-copy-id db
$ ssh db
$ exit
```

### setup ansible
```
$ vi hosts
```

Edit hosts, 

```
[web]
192.168.43.52

[db]
192.168.43.53
```

#### Test
`ansible all -i hosts -m ping`

And skip *hosts* commands, 

```
$ vi ansible.cfg
```

Edit hosts, 

```
[defaults]
hostfile = ./hosts
```


#### Test
`ansible all -m ping`

### create playbook
```
$ vi playbook.yml
```

Edit, 

```yaml
---
- hosts: all
  sudo: yes
  vars_prompt:
    username: "Enter username"
  tasks:
    - name: add a new user
      user: name={{username}}
```

And setup

```
$ ansible-playbook playbook.yml
```

confirmation

```
$ ssh web
[web]$ cat /etc/passwd
```