## grep

grepコマンドを用いて検索を行う。

## keywordにマッチする行を出力する

```sh
grep keyword path
```

## keywordにマッチしない行を出力する

```sh
grep -v keyword path
```

## /some/path配下からkeywordにマッチするファイル およびその箇所を出力する

```sh
grep -r keyword /some/path
```

## 拡張子がtxtのファイルからhogeを検索

```
$ grep "hoge" *.txt
```

## <P>または<p>のある行数を表示

```
$ grep -ci "<p>" index.shtml
```

## httpdのプロセス情報を得る

```
$ ps aux | grep "httpd"
```


## 演習

/home以下から現在ログインしているユーザーの名前を含むファイルを全て列挙して下さい
 • ただしバイナリファイルのマッチ結果および  エラー出力(permission deniedなど)は出力してはなりません．
 • また，どの環境で実行しても同じ処理ができるようにして下さい． (bashで)

```sh
grep -r `whoami` /home ¦ grep -v matches 2>/dev/null !
```

• grep -r と grep -v はよく使う
• エラーが多すぎる場合は/dev/nullに投げて無視

[シェル芸初心者によるシェル芸入門](https://www.slideshare.net/icchyr/ss-52341962)
[【 grep 】 文字列を検索する](http://tech.nikkeibp.co.jp/it/article/COLUMN/20060227/230786/)
