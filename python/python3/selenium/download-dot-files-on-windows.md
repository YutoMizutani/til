## Downloads dot files on Windows

## はじめに

Windowsでは.ドットファイルの作成ができないようになっている。

e.g.
Seleniumで.gitignoreをダウンロードした際、Downloadsフォルダには「gitignore」ファイルが生成される。

## コード

os.rename を用いてpython側から変更する。

```python
import os

dot = "."
separator = "\\"

def is_dot_file_name_first(self, path: str):
    return path.split(separator)[-1][0] == dot

def rename_dot_file(downloaded_file_path: str):
  renamed_path = separator.join(downloaded_file_path.split(separator)[:-1]) + separator + downloaded_file_path.split(separator)[-1][len(dot):]
  os.rename(downloaded_file_path, renamed_path)

path = ...
if is_dot_file_name_first(path):
  rename_dot_file(path)
```

高階関数あたりを使えばもっと短くなるはず。


[エクスプローラー上では「.」（ドット）で始まるファイル名の作成ができない件](http://unsolublesugar.com/20130404/102623/)
