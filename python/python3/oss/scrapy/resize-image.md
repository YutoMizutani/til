## Resizing image using Scrapy

```python
import scrapy
from scrapy.pipelines.images import ImagesPipeline
from scrapy.utils.misc import md5sum
from io import BytesIO

class AppImagesPipeline(ImagesPipeline):
    def get_media_requests(self, item, info):
        for image_url in item['image_urls']:
            yield scrapy.Request(
                image_url,
                meta = {
                    'base_domain': item['base_domain'],
                    'id': item['id']
                }
            )

    def image_downloaded(self, response, request, info):
        checksum = None
        for path, image, buf in self.get_images(response, request, info):
            if checksum is None:
                buf.seek(0)
                checksum = md5sum(buf)
            filename = response.meta['id'] + '.jpg'

            width, height = image.size
            path = '%s/original/%s' % (response.meta['base_domain'], filename)
            self.store.persist_file(
                path, buf, info,
                meta = { 'width': width, 'height': height }
            )

            resized_width = 500
            resized_height = int(resized_width / width * height)
            image = image.resize((resized_width, resized_height))
            path = '%s/500/%s' % (response.meta['base_domain'], filename)
            buf = BytesIO()
            image.save(buf, 'JPEG')
            self.store.persist_file(
                path, buf, info,
                meta = { 'width': resized_width, 'height': resized_height }
            )

            resized_width = 900
            resized_height = int(resized_width / width * height)
            image = image.resize((resized_width, resized_height))
            path = '%s/900/%s' % (response.meta['base_domain'], filename)
            buf = BytesIO()
            image.save(buf, 'JPEG')
            self.store.persist_file(
                path, buf, info,
                meta = { 'width': resized_width, 'height': resized_height }
            )
        return checksum
```

[Downloading and processing files and images](https://docs.scrapy.org/en/latest/topics/media-pipeline.html#topics-images-thumbnails)
[Up scaling image size downloaded by scrapy image pipeline](https://stackoverflow.com/questions/35846954/up-scaling-image-size-downloaded-by-scrapy-image-pipeline)
[How to give custom name to images when downloading through scrapy](https://stackoverflow.com/questions/31779995/how-to-give-custom-name-to-images-when-downloading-through-scrapy)
