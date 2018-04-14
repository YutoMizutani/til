## Currying

```python
def add(x: int):
    def arg(y: int):
        return x + y
    return arg
```

### Usage

```python
plus5 = add(5)
print(plus5(10)) # 15
```

[https://qiita.com/dankogai/items/46fedc447dd93d1e0fbc](https://qiita.com/dankogai/items/46fedc447dd93d1e0fbc)