## is a text include japanese?


```python
import unicodedata

def decision_include_ja(text)->bool:
    for char in text:
        name = unicodedata.name(char)
        if "CJK UNIFIED" in name \
        or "HIRAGANA" in name \
        or "KATAKANA" in name:
            return True
    return False
```

[source1](http://minus9d.hatenablog.com/entry/2015/07/16/231608)
[source2](http://stackoverflow.com/questions/16027450/is-there-a-way-to-know-whether-a-unicode-string-contains-any-chinese-japanese-ch)
