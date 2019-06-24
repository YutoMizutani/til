## Copy to clipboard

ターミナルでの標準出力をクリップボードに記憶する。

#### OSX

`| pbcopy`

```
$ <foo> | pbcopy
```

e.g. foo.txtの内容をコピーする場合

```
$ cat foo.txt | pbcopy
```

#### Ubuntu

```
$ sudo apt install xsel
```

e.g. foo.txtの内容をコピーする場合

```
$ cat foo.txt | xsel --clipboard --input
```

好みでエイリアスを追加する。

```
$ alias pbcopy='xsel --clipboard --input' >> .<bar>rc
```

[コマンドラインからクリップボードへのコピー](https://qiita.com/Kzno/items/6f2fa98256bdffb0fd43)
