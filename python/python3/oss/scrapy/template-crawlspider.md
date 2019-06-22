## CrawlSpider template

```python
# -*- coding: utf-8 -*-
import scrapy
from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor
from app.items import AppItem

class FooSpider(CrawlSpider):
    name = 'foo_com'
    allowed_domains = ['foo.com']
    start_urls = [
        # Search all page
        'https://foo.com?search=&page=0'
    ]

    rules = (
        # Paging
        Rule(LinkExtractor(allow=('^https://foo.com?search=&.*page=\d+.*', )), follow=True),
        # Detail page
        Rule(LinkExtractor(allow=('^https://foo.com/detail/.*', )), callback='parse_item'),
    )

    def parse_item(self, response):
        self.logger.info('Hi, this is an item page! %s', response.url)
        item = AppItem()
        yield item
```

[Scrapy Docs](https://scrapy-ja.readthedocs.io)
