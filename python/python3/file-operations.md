## ファイル操作

### move

```python
import os, shutil

def __make_directory(self, path: str):
    try:
        os.makedirs(path)
    except:
        pass

def __move_file(self, from_path: str, to_path: str):
    self.__make_directory(to_path)
    shutil.move(from_path, to_path)
```

[[Pythonファイル/ディレクトリ操作](https://qiita.com/supersaiakujin/items/12451cd2b8315fe7d054)
