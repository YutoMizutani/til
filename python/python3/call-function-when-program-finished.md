## Call function when the program was finished.

プログラムの終了時に関数を呼び出す。
* エラー発生時などの停止時には動作しない。

```python
import atexit

def hello():
  print("Hello, world!!")

if __name__ == "__main__":
    atexit.register(hello)
    print("init")

# init
# Hello, world!!
```

[atexit – プログラムの終了時に関数を呼び出す](http://ja.pymotw.com/2/atexit/)
