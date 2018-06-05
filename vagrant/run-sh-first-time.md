## Run ShellScript for the first time after `vagrant up`

Vagrantfile
```
Vagrant::Config.run do |config|
  # ...
  # vagrant up のときに bootstrap.sh というスクリプトを実行する
  config.vm.provision :shell, :path => "bootstrap.sh"
end
```

以下、1度のみ実行するShellScript

bootstrap.sh
```sh
#!/usr/bin/bash

# Exit if already bootstrapped
test -f /etc/bootstrapped >> exit
```

[Vagrant 起動時に1回だけ実行するスクリプトを設定する](http://blogs.zealot.co.jp/archives/176)
