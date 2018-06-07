## Write multiple lines text to file and sudo permitted file on ShellScript

通常のファイルであれば以下のように書くことで実現できる。

```sh
cat << 'EOT' > <foo; file path>
bar
baz
qux
EOT
```

一方で、sudo権限でしか書き込みできない`~/var/`のようなread onlyに対して実行する場合、

```sh
sudo cat << 'EOT' | sudo tee <foo; file path>
bar
baz
qux
EOT
```

とする必要がある。

[スーパーユーザー権限が必要なファイルにcatコマンドでテキストを書き込む。](http://blog.katty.in/3922)
