# Set up MEAN with Yeoman on CentOS7.4

Init Vagrantfile

```
$ mkdir <foo> && cd <foo>
$ vi Vagrantfile
```

And paste it,

Vagrantfile
```sh
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
  config.vm.box = "bento/centos-7.4"

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
  config.vm.network "private_network", ip: "192.168.44.10"

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
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    # At least 4 GB
    vb.memory = "4096"
  end
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

  # http://blogs.zealot.co.jp/archives/176
  # https://anz-note.tumblr.com/post/105946767956/vagrant%E3%81%AEprovision%E3%81%A7%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%82%92up%E3%81%A8%E5%90%8C%E6%99%82%E3%81%AB%E6%95%B4%E3%81%88%E3%82%8B-%CF%89-%E3%82%9E
  # vagrant up のときに bootstrap.sh というスクリプトを実行する
  config.vm.provision :shell, :path => "bootstrap.sh", :privileged => false
end
```

Then, create sh

```
$ vi bootstrap.sh
```

bootstrap.sh
```sh
#!/usr/bin/env bash


# http://blogs.zealot.co.jp/archives/176
echo "Exit if already bootstrapped"
test -f /etc/bootstrapped && exit

echo "Update yum"
sudo yum update

# https://qiita.com/kurun/items/d957e65a084019f9f610
echo "Install vim and epel first"
sudo yum -y install vim epel-release

# https://sterfield.co.jp/blog/development/yeoman%E3%81%A7mean%E7%92%B0%E5%A2%83%E3%82%92%E6%95%B4%E3%81%88%E3%82%8B/

echo "Install MongoDB"
# http://blog.katty.in/3922
sudo cat << 'EOT' | /etc/yum.repos.d/mongodb.repo
    [mongodb]
    name=MongoDB Repository
    baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
    gpgcheck=0
    enabled=1
EOT

yum -y install mongodb-org
service mongod start
chkconfig mongod on

echo "Install Node.js and npm"
# https://github.com/hokaccha/nodebrew
sudo curl -L git.io/nodebrew | perl - setup
echo export PATH=$HOME/.nodebrew/current/bin:$PATH >> ~/.bash_profile
source ~/.bash_profile
nodebrew install-binary stable
nodebrew use latest

echo "Install Yeoman"
npm init
npm install -g yo bower grunt-cli gulp
npm install -g generator-webapp

echo "Install Express"
npm install -g express-generator

echo "Install Angular.js"
npm install -g generator-angular-fullstack

# echo "Launch yo"
# yo

# echo "Run server"
# grunt serve
```

Setup vagrant

```
$ vagrant up
```

[](http://vdeep.net/vagrant-start-web-server)
[](https://github.com/cmoudy/mean-vagrant)
[MEAN環境をVagrantで構築してみた](https://qiita.com/kurun/items/d957e65a084019f9f610)
[YeomanでMEAN環境を整える](https://sterfield.co.jp/blog/development/yeoman%E3%81%A7mean%E7%92%B0%E5%A2%83%E3%82%92%E6%95%B4%E3%81%88%E3%82%8B/)
