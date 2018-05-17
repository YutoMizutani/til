## Catch error description

```python
try:
  print("hogehoge")
except Exception as e:
  print(str(e))
  print("type: " + str(type(e)))
  print("args: ") + str(e.args))
  print("message:" + e.message)
```

[Pythonでtry exceptの書き方と、エラー内容の取得方法](https://symfoware.blog.fc2.com/blog-entry-873.html)
