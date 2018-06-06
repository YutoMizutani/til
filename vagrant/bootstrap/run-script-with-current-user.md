## Run script with current user

`privileged`オプションがない場合、実行ユーザーがrootで実行され、
インストール先のパスが正常でない不具合に見舞われる。

e.g. bootstrap.shでの実行でnodejsをインストール後にnpmが通らない。

#### 解決方法

`, :privileged => false`オプションを追加する必要がある。

Vagrantfile
```sh
config.vm.provision :shell, :path => "bootstrap.sh", :privileged => false
```

以下のリンクは`:privileged => false`の前に`, `がないので実行できない。

[Vagrantのprovisionでローカル開発環境をupと同時に整える (｀･ω･´)ゞ](https://anz-note.tumblr.com/post/105946767956/vagrant%E3%81%AEprovision%E3%81%A7%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%82%92up%E3%81%A8%E5%90%8C%E6%99%82%E3%81%AB%E6%95%B4%E3%81%88%E3%82%8B-%CF%89-%E3%82%9E)
