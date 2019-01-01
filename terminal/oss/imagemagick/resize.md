## Resize image using ImageMagick

```.zshrc
function resize (){ convert -resize $2x$2 -unsharp 2x1.4+0.5+0 -quality 100 -verbose $1 ${1%.png}-$2x$2.png }
```

```sh
$ resize ./input.png 1024 # -> input-1024x1024.png
```

[シェル変数の末尾の文字を削除する - 何でも屋エンジニアのブログ](http://biibiebisuke.hatenablog.com/entry/2015/04/21/230601)
