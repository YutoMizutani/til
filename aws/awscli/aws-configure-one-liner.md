## One liner for aws configure

boto3を利用する際，regionを設定しないとワーニングが延々と垂れ流されるが，`aws configure` では入力待ちが発生してしまい，Dockerfileでは不都合である。

```
$ pip3 install awscli
$ aws configure --output json --region ap-northeast-1 set aws_access_key_id ${AWS_ACCESS_KEY_ID}
```
