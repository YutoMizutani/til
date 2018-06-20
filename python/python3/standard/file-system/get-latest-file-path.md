## Get latest file path on Python3

該当pathにおける変更履歴が最新のファイルのパスを取得する。

```python
import os

def get_latest_modified_file_paths(self, path):
    target = os.path.join(path, '*')
    files = [(f, os.path.getmtime(f)) for f in glob(target)]
    latest_modified_file_paths = map(lambda files: files[0], sorted(files, key=lambda files: files[1])[::-1])
    return latest_modified_file_paths
```

[python でディレクトリ配下の最新のファイル名(フルパス)を取得する](http://rriifftt.hatenablog.com/entry/2016/06/09/144851)
