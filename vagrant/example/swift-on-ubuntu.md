## Swift developmental environment on Ubuntu

Vagrantfile

```sh
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.provision :shell, :path => "bootstrap.sh", :privileged => false
end
```

bootstrap.sh

```sh
#!/usr/bin/env bash

# http://blogs.zealot.co.jp/archives/176
echo "Exit if already bootstrapped"
test -f /etc/bootstrapped && exit

echo "Update"
sudo apt-get dist-upgrade -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y language-pack-UTF-8

echo "Install Dependencies"
sudo apt-get install -y wget clang libpython2.7 libxml2 curl libbsd-dev

echo "Install Swift"
wget https://swift.org/builds/swift-4.2.1-release/ubuntu1804/swift-4.2.1-RELEASE/swift-4.2.1-RELEASE-ubuntu18.04.tar.gz
tar -zxvf swift-4.2.1-RELEASE-ubuntu18.04.tar.gz
sudo mv swift-4.2.1-RELEASE-ubuntu18.04 /usr/local/swift
echo 'export PATH="/usr/local/swift/usr/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

[Swiftコンパイラ開発環境構築](https://qiita.com/rintaro/items/2047a9b88d9249459d9a)
[Swiftのビルド環境を仮想マシンとして構築する(Vagrantのボックスを構築)](http://msyksphinz.hatenablog.com/entry/2015/12/07/010000)
[apple/swift](https://github.com/apple/swift)
