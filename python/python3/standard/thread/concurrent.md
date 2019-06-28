## Concurrent

```python
# -*- coding: utf-8 -*-

import concurrent.futures
import time

class Foo:
    array = list(range(1, 101))
    i = 0
    state = True

    def __init__(self):
        executor = concurrent.futures.ThreadPoolExecutor(max_workers=1)
        executor.submit(self.runner)
        time.sleep(0.5)
        self.state = False
        print("Stop")
        time.sleep(0.5)
        print("Resume")
        self.state = True
        executor.submit(self.runner)
        time.sleep(1)

    def runner(self):
        while self.state:
            print(self.array[self.i])
            self.i += 1
            time.sleep(0.01)
            if self.i >= len(self.array):
                break

if __name__ == '__main__':
    Foo()
```

[concurrent.futures -- 並列タスク実行](https://docs.python.org/ja/3/library/concurrent.futures.html)
