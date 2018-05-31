## Method chain

メソッドの最後にselfを返すことで、method chainが可能。

```python
class Main:
  def __init__(self):
    self.chain().chain().chain()

  def chain(self):
    print("Chain")
    return self

if __name__ == "__main__":
    main = Main()

# Chain
# Chain
# Chain
```
