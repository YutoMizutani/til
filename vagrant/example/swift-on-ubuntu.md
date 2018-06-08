## Swift developmental environment on Ubuntu

Vagrantfile

```sh
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
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
sudo apt dist-upgrade -y
sudo apt update -y
sudo apt upgrade -y

echo "Install Swift"
sudo apt -y install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev systemtap-sdt-dev tzdata rsync

git clone https://github.com/apple/swift.git swift
git clone https://github.com/apple/swift-llvm.git llvm
git clone https://github.com/apple/swift-clang.git clang
git clone https://github.com/apple/swift-lldb.git lldb
git clone https://github.com/apple/swift-cmark.git cmark
git clone https://github.com/apple/swift-llbuild.git llbuild
git clone https://github.com/apple/swift-package-manager.git swiftpm
git clone https://github.com/apple/swift-corelibs-xctest.git
git clone https://github.com/apple/swift-corelibs-foundation.git

# Download source code of Swift
git "/home/vagrant/swift/swift" do
  repository "https://github.com/apple/swift.git"
  user "vagrant"
  group "vagrant"
  action :sync
end
git "/home/vagrant/swift/llvm" do
  repository "https://github.com/apple/swift-llvm.git"
  user "vagrant"
  group "vagrant"
  action :sync
end
...
execute "Execute Swift-Build" do
  cwd "/home/vagrant/swift"
  command " sudo ./swift/utils/build-script"
  user "root"
  group "root"
  action :run
end


cat << 'EOT' > ./printme.swift
print("Hello World")
EOT
swiftc printme.swift -o printme
printme.swift
```

[Swiftのビルド環境を仮想マシンとして構築する(Vagrantのボックスを構築)](http://msyksphinz.hatenablog.com/entry/2015/12/07/010000)
[apple/swift](https://github.com/apple/swift)
