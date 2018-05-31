## Write file

ファイル書き込み

#### 上書き

```python
def write(path: str, text: str):
  file = open(path, "w")
  file.write(text)
  file.close()
```

#### 追記

```python
def write(path: str, text: str):
  text += "\n"
  file = open(path, "a")
  file.write(text)
  file.close()
```

#### 追記(UTF-8)

```python
import codecs

def write(path: str, text: str):
  text += "\n"
  file = codecs.open(path, "a", "utf-8")
  file.write(text)
  file.close()
```

[Python3 でファイルの文字コードを変換する](https://qiita.com/nskydiving/items/c900c27042bcd11517ee)
