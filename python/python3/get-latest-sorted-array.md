## 最新のファイル順にパスを表示する

```python
import os
from glob import glob

def get_latest_modified_file_path_without_folder(self, path) -> str or None:
    paths = self.get_latest_modified_file_paths(path)
    for path in paths:
        if os.path.isfile(path):
            return path
    return None

def get_latest_modified_file_paths(self, path):
    # http://rriifftt.hatenablog.com/entry/2016/06/09/144851
    target = os.path.join(path, '*')
    files = [(f, os.path.getmtime(f)) for f in glob(target)]
    latest_modified_file_paths = map(lambda files: files[0], sorted(files, key=lambda files: files[1])[::-1])
    return latest_modified_file_paths
```

[python でディレクトリ配下の最新のファイル名(フルパス)を取得する](http://rriifftt.hatenablog.com/entry/2016/06/09/144851)
