# MySQL pipeline

```settings.python
ITEM_PIPELINES = {
    'myproject.pipelines.PricePipeline': 300,
    'myproject.pipelines.JsonWriterPipeline': 800,
}
```

[Item pipeline](https://doc.scrapy.org/en/latest/topics/item-pipeline.html)
