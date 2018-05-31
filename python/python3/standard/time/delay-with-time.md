## Delay with time

#### Run in main thread

```python
# -*- coding: utf-8 -*-

from time import sleep

def delay(sec: int):
    sleep(sec)

if __name__ == "__main__":
    """ Usage """
    def hello():
        print("Hello, world!!")
    delay(10)
    hello()
```
