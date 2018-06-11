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
sudo apt-get dist-upgrade -y
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Install Dependencies"
sudo apt-get -y install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev systemtap-sdt-dev tzdata rsync

echo "Update cmake"
# https://cmake.org/download/
sudo apt remove cmake -y

curl -L -O https://cmake.org/files/v3.11/cmake-3.11.3-Linux-x86_64.sh
sudo bash cmake-3.11.3-Linux-x86_64.sh --skip-license --exclude-subdir --prefix=/usr/local/bin
rm cmake-3.11.3-Linux-x86_64.sh
# chmod +x /path/to/cmake-3.11.3-Linux-x86_64.sh
# sudo /path/to/cmake-3.11.3-Linux-x86_64.sh
# sudo ln -s /opt/cmake-3.11.3-Linux-x86_64/bin/* /usr/local/bin

echo "Install Swift"
mkdir swift-source
cd swift-source

git clone https://github.com/apple/swift.git
./swift/utils/update-checkout --clone

echo "Build Swift"
cd swift
utils/build-script -Rt

echo "Check Swift install"
# ../build/Ninja-ReleaseAssert/swift-macosx-x86_64/bin/swift -version

cat << 'EOT' > ~/update-swift.sh
#!/usr/bin/env bash
echo "Update Swift"
cd ~/swift-source/swift
utils/update-checkout
utils/build-script -Rt
EOT
```

[Swiftコンパイラ開発環境構築](https://qiita.com/rintaro/items/2047a9b88d9249459d9a)
[Swiftのビルド環境を仮想マシンとして構築する(Vagrantのボックスを構築)](http://msyksphinz.hatenablog.com/entry/2015/12/07/010000)
[apple/swift](https://github.com/apple/swift)
