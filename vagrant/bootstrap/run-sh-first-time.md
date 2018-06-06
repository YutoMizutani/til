## Run ShellScript for the first time after `vagrant up`

Vagrantfile
```
Vagrant::Config.run do |config|
  # ...
  # vagrant up のときに bootstrap.sh というスクリプトを実行する。
  config.vm.provision :shell, :path => "bootstrap.sh", :privileged => false
end
```

以下、1度のみ実行するShellScript

bootstrap.sh
```sh
#!/usr/bin/env bash

# Exit if already bootstrapped
test -f /etc/bootstrapped >> exit
```

[Vagrant 起動時に1回だけ実行するスクリプトを設定する](http://blogs.zealot.co.jp/archives/176)
[Vagrantのprovisionでローカル開発環境をupと同時に整える (｀･ω･´)ゞ](https://anz-note.tumblr.com/post/105946767956/vagrant%E3%81%AEprovision%E3%81%A7%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%82%92up%E3%81%A8%E5%90%8C%E6%99%82%E3%81%AB%E6%95%B4%E3%81%88%E3%82%8B-%CF%89-%E3%82%9E)
