## Setup rails on Ruby 2.5.1

`.ruby_versions` が 2.5.1 と指定されたRails project の setup

bundler と mysql で fail する

```
$ rbenv install 2.5.1
$ rbenv local 2.5.1
$ rbenv rehash
$ sudo gem install bundler -v '1.17.1'
$ sudo gem install nokogiri -v '1.10.1'
$ bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"
$ sudo bundle install
```

[RailsプロジェクトでMySQLがbundle installできなかった](https://qiita.com/akito19/items/e1dc54f907987e688cc0)
[bundler version 2.0.1 fails to run #6882](https://github.com/bundler/bundler/issues/6882)
