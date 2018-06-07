# Set up MEAN RESTful API server on CentOS7.4

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

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.network "private_network", ip: "192.168.40.10"
  config.vm.provider "virtualbox" do |vb|
    # At least 4 GB
    vb.memory = "4096"
  end

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
sudo cat << 'EOT' | sudo tee /etc/yum.repos.d/mongodb.repo
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOT

sudo yum -y install mongodb-org
service mongod start
chkconfig mongod on

echo "Install Node.js and npm"
# https://github.com/hokaccha/nodebrew
sudo curl -L git.io/nodebrew | perl - setup
echo export PATH=$HOME/.nodebrew/current/bin:$PATH >> ~/.bash_profile
source ~/.bash_profile
nodebrew install-binary stable
nodebrew use latest

echo "Start RESTful API proj"
mkdir jsonAPI
cd jsonAPI
mkdir app
cd app
mkdir models

cat << 'EOT' > package.json
{
    "name": "jsonAPI",
    "main": "server.js",
    "dependencies": {
        "express": "~4.0.0",
        "mongoose": "~3.6.13",
        "body-parser": "~1.0.1"
    }
}
EOT

cat << 'EOT' > server.js
// server.js

// 必要なパッケージの読み込み
var express    = require('express');
var app        = express();
var bodyParser = require('body-parser');

// POSTでdataを受け取るための記述
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// 3000番を指定
var port = process.env.PORT || 3000;

// expressでAPIサーバを使うための準備
var router = express.Router();

router.use(function(req, res, next) {
    console.log('Something is happening.');
    next();
});

// 正しく実行出来るか左記にアクセスしてテストする (GET http://localhost:3000/api)
router.get('/', function(req, res) {
    res.json({ message: 'Hello, RESTful API!!' });
});


// ルーティング登録
app.use('/api', router);

//サーバ起動
app.listen(port);
console.log('listen on port ' + port);
EOT

echo "npm install"
npm install

echo "npm audit fix --force"
npm audit fix --force

echo "Start server"
node server.js
```

Setup vagrant

```
$ vagrant up
$ curl http://192.168.40.10:3000/api
```

[Node.js + Express 4.x + MongoDB(Mongoose)でRESTfulなjsonAPIサーバの作成を丁寧に解説する．+ テストクライアントを用いたAPIテストまで](https://qiita.com/shopetan/items/58a62a366aac4f5faa20)
[YeomanでMEAN環境を整える](https://sterfield.co.jp/blog/development/yeoman%E3%81%A7mean%E7%92%B0%E5%A2%83%E3%82%92%E6%95%B4%E3%81%88%E3%82%8B/)
[Vagrantで仮想マシンに接続＆Webサーバを立ち上げてみよう](http://vdeep.net/vagrant-start-web-server)
[cmoudy/mean-vagrant](https://github.com/cmoudy/mean-vagrant)
[MEAN環境をVagrantで構築してみた](https://qiita.com/kurun/items/d957e65a084019f9f610)
[ExpressとMongoDBで手っ取り早くREST APIを作る](https://qiita.com/okyk/items/274582807a9fedb8a740)
[npm-audit](https://docs.npmjs.com/cli/audit)
