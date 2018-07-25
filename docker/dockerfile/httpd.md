## httpd

Dockerfile
```sh
FROM centos
MAINTAINER Gen Taguchi <taguchi@gmail.com>
# RUN: buildするときに実行される
# RUN echo "now building..."
# CMD: runするときに実行される
# CMD echo "now running..."
# CMD ["echo", "now running..."]
RUN yum install -y httpd
ADD ./index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
```

index.html
```html
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
</head>
<body>
Hello, world from Docker!!
</body>
</html>
```

```
$ sudo docker build -t httpd .
$ sudo docker run -p 8080:80 -d httpd
```
