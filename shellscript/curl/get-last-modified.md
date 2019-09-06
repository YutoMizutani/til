## Get last modified

```sh
echo https://www.google.com | xargs curl --head -isS | grep -i 'date: '
```

[curl usage to get header](https://stackoverflow.com/a/39190127)
