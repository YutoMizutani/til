## ConfigParser

Pythonでは、ConfigParserを用いることで、簡単に設定を読み込むことができる。

## config.ini

```ini
# test
[foo]
bar = baz
```

## main.py

```python
import configparser

inifile = configparser.ConfigParser()
inifile.read("./config.ini", "UTF-8")

bar = inifile.get("foo", "bar")
print(bar) # baz
```

[設定ファイル](https://www.python-izm.com/advanced/config_parser/)
