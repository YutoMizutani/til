## install Swift for Ubuntu

UbuntuにSwiftをインストールする。

#### 依存関係のインストール

```
$ sudo apt-get install clang libpython2.7 libxml2
```

#### Ubuntuのバージョン確認

```
$ cat /etc/lsb-release
```

DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.4 LTS"

#### 対応するバージョンのSwiftをインストール

```
// Swiftのダウンロード(適宜変更)
$ wget https://swift.org/builds/swift-4.1-release/ubuntu1604/swift-4.1-RELEASE/swift-4.1-RELEASE-ubuntu16.04.tar.gz

// 解凍
$ tar zxfv swift-4.1-RELEASE-ubuntu16.04.tar.gz

// ルート権限で移動
$ sudo su
# cd /home/<foo username>
# mv swift-4.1-RELEASE-ubuntu16.04 /usr/local/swift

// aliasを追加
$ alias swift="/usr/local/swift/usr/bin/swift" >> .<bar>rc

// 確認
$ swift -v
```

[Ubuntu 16.04にSwift4をインストールしてVaporでハローワールドするまで #love_swift](https://qiita.com/n0bisuke/items/f62e8f425fc20ede6ffc)

[Ubuntu で Swift 言語を使う](http://dotnsf.blog.jp/archives/1065265997.html)
