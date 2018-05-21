## Named arguments

Pythonにて名前付き引数を指定するには「*」を用いる。

-> spyderでは認識されない？

```python
def add(x: int, *, y: int) -> int:
  return x + y

print(add(2, y: 3)) # 5
```
