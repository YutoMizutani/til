## Install Swift for Ubuntu

```
$ sudo apt install -y wget clang libpython2.7 libxml2 curl libbsd-dev
$ wget https://swift.org/builds/swift-4.2.1-release/ubuntu1804/swift-4.2.1-$ RELEASE/swift-4.2.1-RELEASE-ubuntu18.04.tar.gz
$ tar -zxvf swift-4.2.1-RELEASE-ubuntu18.04.tar.gz
$ sudo mv swift-4.2.1-RELEASE-ubuntu18.04 /usr/local/swift
$ echo 'export PATH="/usr/local/swift/usr/bin:$PATH"' >> ~/.bash_profile
$ source ~/.bash_profile
```

[LinuxでもSwiftを使ってGUI開発をしたい!【SwiftGtk】](https://qiita.com/YutoMizutani/items/a550b6fa5767a7c55eea)
