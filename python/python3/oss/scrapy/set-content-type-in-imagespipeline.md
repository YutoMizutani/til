## Set ContentType in ImagesPipeLine

```python
self.store.persist_file(
    path, buf, info,
    meta={'width': width, 'height': height},
    headers={'Content-Type': 'image/jpeg'}
)
```

[How to give custom name to images when downloading through scrapy](https://stackoverflow.com/a/44430130)
