## URL encode

```python
$ echo "this & that" | perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"'
# this%20%26%20that
```

[Url Encode](https://www.commandlinefu.com/commands/view/4840/url-encode)
