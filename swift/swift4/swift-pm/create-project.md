## Create project using Swift Package Manager

Swift Package Manager上でプロジェクトを作成する方法。

```
$ mkdir <foo>
$ cd <foo>
$ swift package init --type executable
```

僕は面倒なのでここまでやっちゃう。

```
$ swift package init --type executable && git init && git checkout -b develop && git add . && git commit -m "init"
```

[Swift Package Manager (SwiftPM) で作るコマンドラインツール](https://qiita.com/mono0926/items/e8fdd97115780204f797)
