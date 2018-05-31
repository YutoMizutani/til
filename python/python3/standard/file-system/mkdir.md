## Make directory

ディレクトリ(フォルダ)を作成するには、os.mkdir(path)を使用します。

```python
import os
os.mkdir("path")
```

ディレクトリ(フォルダ)の階層を作成する場合には、os.makedirs(path)を使用します。
すでにパスの途中までディレクトリ(フォルダ)が存在する場合は、残りのディレクトリ(フォルダ)を作成します。

```python
import os
os.mkdir("foo\\bar\\baz")
```

[ディレクトリを作成する](http://www.gesource.jp/programming/python/code/0009.html)
