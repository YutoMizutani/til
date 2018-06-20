## Write log on Python3

ログを追加する。
Python用のログ用frameworkも存在するが、簡単なのは単にファイルに保存してしまうこと。

```python
from datetime import datetime
import codecs

def get_current_time(self) -> str:
    return datetime.now().strftime("[%Y/%m/%d %H:%M:%S]")

def write(self, text: str, path: str):
    text = self.get_current_time() + " " + text
    file = codecs.open(path, "a", "utf-8")
    file.write(text + "\n")
    file.close()
```

#### Usage

```python
from datetime import datetime

self.log_file_name = datetime.now().strftime("%Y%m%d%H%M")
self.path = "hist\\" + self.log_file_name + ".log"
self.write("Hello, world!!", self.path)
```
