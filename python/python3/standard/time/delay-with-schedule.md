## Scheduled delay

時刻指定で処理を実行する。

```python
# -*- coding: utf-8 -*-

import sched
import time
from datetime import datetime

def scheduler(f, _date: str):
    """ _date (e.g. '2017-10-12 12:00:00')にf関数を実行する """
    scheduler = sched.scheduler(time.time, time.sleep)
    run_at = datetime.strptime(_date, "%Y-%m-%d %H:%M:%S")
    run_at = int(time.mktime(run_at.utctimetuple()))
    scheduler.enterabs(run_at, 1, f)
    scheduler.run()

def scheduler_today(f, _time: str):
    """ 本日の_time (e.g. '12:00:00')にf関数を実行する """
    scheduler = sched.scheduler(time.time, time.sleep)
    run_at = datetime.strptime(datetime.now().strftime("%Y-%m-%d ")+_time, "%Y-%m-%d %H:%M:%S")
    run_at = int(time.mktime(run_at.utctimetuple()))
    scheduler.enterabs(run_at, 1, f)
    scheduler.run()
```

#### Usage

```python
if __name__ == "__main__":
    """ Usage """
    def hello():
        print("Hello, world!!")
    scheduler_today(hello, "12:00:00")
```

[指定時刻にある関数を実行する方法](https://teratail.com/questions/95947)
