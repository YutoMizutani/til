## override parent methods

```python
class Parent:
    def __init__(self):
      print("Hello, world!!")

class Child(Parent):
    def __init__(self):
        # override
        super(Child, self).__init__()

if __name__ == "__main__":
    main = Child()
```

[Python の super() 関数の使い方](https://www.lifewithpython.com/2014/01/python-super-function.html)
