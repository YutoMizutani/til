## Lambda for Python

```./functions/hello/function.json
{
    "description": "",
    "runtime": "python3.7",
    "handler": "main.lambda_handler"
}
```

```./functions/hello/main.py
import os
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Event: " + str(event))
    return {
        'isBase64Encoded': False,
        'statusCode': 200,
        'headers': {},
        'body': '{"message": "Hello from AWS Lambda"}'
    }
```

[Python の AWS Lambda 関数ログ作成](https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/python-logging.html)
[AWS Lambda関数の実装](https://qiita.com/baikichiz/items/2de7c4c0dcf9b051037a#aws-lambda関数の実装)
