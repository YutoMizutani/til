## Install ruby

```
$ brew install rbenv ruby-build
```

## Tutorial - install rbenv, install latest ruby, install bundler

```
$ brew install rbenv ruby-build
$ rbenv install $(rbenv install -l | grep -v - | tail -1)
$ rbenv global $(rbenv install -l | grep -v - | tail -1)
$ gem install bundler
$ rbenv rehash
```

## Confirm latest version

```
$ rbenv install -l | grep -v - | tail -1
```

## Install latest version

```
$ rbenv r install $(rbenv install -l | grep -v - | tail -1)
```

[MacにHomeBrew,rbenv,bundlerをインストールする](https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b)
[rbenvでRubyの最新安定版をインストールするワンライナー](https://mawatari.jp/archives/install-latest-stable-version-of-ruby-using-rbenv)
