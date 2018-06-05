## Redirect

## >

コマンドの出力を任意のファイルに書き出す。
ファイルが既に存在する場合は、file existsエラーが発生する。

e.g. ls -lの結果をfoo.txtに書き込む
```
$ ls -l > foo.txt
```

## >>

コマンドの出力を任意のファイルに追記する

e.g. ls -lの結果をfoo.txtに追記する
```
$ ls -l >> foo.txt
```

## <

コマンドへの入力を任意のファイルから行う

e.g. bar.txtをbashで実行する
```
$ bash < bar.txt
```

[シェル芸初心者によるシェル芸入門](https://www.slideshare.net/icchyr/ss-52341962)
[UNIX & Linux コマンド・シェルスクリプト リファレンス](https://shellscript.sunone.me/input_output.html#%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%AE%E5%87%BA%E5%8A%9B%E3%82%92-file-%E3%81%B8%E8%BF%BD%E8%A8%98%E3%81%99%E3%82%8B)
