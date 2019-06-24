## Resize image in command line

#### Dependencies

```
$ brew install imagemagick
```

#### Resize

> a.pngを縮小してb.pngという名前で保存

```
$ convert -resize 100x -unsharp 2x1.4+0.5+0 -quality 100 -verbose a.png b.png
```

`-resize 100x`: 横幅の数値を入れ、縦は指定しない。この場合、横幅が100pxになり、縦は元画像の縦横比に従って自動調整される。

`-unsharp`: 画像を縮小するとボケるので「-unsharp」（アンシャープマスク）にて、鮮明になるようシャープネス処理をする。多くの場合、これは必須。このオプションは、画質を大きく左右する。

`-quality`: 画像の圧縮レベル。

`-verbose`: モニタに、コマンドの動きを出力する。このオプションがないと、「convert」と「mogrify」は、モニタには何も出力せずにコマンドを終えるので、本当に画像が処理されたのかどうかが心配な場合は、このオプションを付ける。

[コマンドラインで画像を縮小する：ImageMagick convert mogrify](http://d.hatena.ne.jp/weblinuxmemo/20090929/p1)
