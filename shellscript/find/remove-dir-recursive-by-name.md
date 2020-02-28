## Remove directtory recursive by name

```sh
$ find . -name "node_modules" -type d | xargs rm -rf
```

[【find】Linuxでファイル・ディレクトリ検索をするコマンド](https://uxmilk.jp/8583)
[linuxで再帰的に特定の拡張子のファイルのみ削除](https://mem-archive.com/2018/10/13/post-774/)
