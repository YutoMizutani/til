## URL parse

When entered japanese URL, but no create links.
So parse japanese to byte string.

```python
import urllib.parse
# byte -> ja
urllib.parse.unquote(text)
# ja -> byte
urllib.parse.quote(text)
```

But it updates all characters, cannot recongnize url from any browsers,
so it should be replace belows.

```python
import urllib.parse
# byte -> ja
urllib.parse.unquote(text.replace(':', '%3A').replace('/', '%2F'))
# ja -> byte
urllib.parse.quote(text).replace('%3A', ':').replace('%2F', '/')
```

[source](http://shuzo-kino.hateblo.jp/entry/2016/10/22/224034)
