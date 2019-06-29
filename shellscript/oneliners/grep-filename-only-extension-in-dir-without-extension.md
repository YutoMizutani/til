## Grep filename in dir without output extension

フォルダ内の `__init__.py` 以外のPythonファイルのファイル名のみを抽出したい

```
$ ls -t foo | grep .py$ | grep -v __init__.py | xargs basename -s .py | xargs -I {} -n 1 echo {}
```

```sh
ls -t foo # 更新時順にfooディレクトリ以下をlsする
grep .py$ # .pyで終わる文字を抽出する
grep -v __init__.py # __init__.pyを除外する
xargs basename -s .py # .pyを除くファイル名を抽出する
xargs -I {} -n 1 echo {} # 1行ずつ変数名として定義した`{}`をe出力する
```
