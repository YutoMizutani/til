## Create symbolic link

`mklink`コマンドを使用する。

```
C:\Users>mklink
シンボリック リンクを作成します。

MKLINK [[/D] | [/H] | [/J]] リンク ターゲット

        /D          ディレクトリのシンボリック リンクを作成します。既定では、
                    ファイルのシンボリック リンクが作成されます。
        /H          シンボリック リンクではなく、ハード リンクを作成します。
        /J          ディレクトリ ジャンクションを作成します。
        リンク      新しいシンボリック リンク名を指定します。
        ターゲット  新しいリンクが参照するパス (相対または絶対)
                    を指定します。
```

#### ディレクトリのsym linkを作成する場合

```
> mklink /D リンク名 パス
```

[Windowsのシンボリックリンクとジャンクションとハードリンクの違い](http://www.atmarkit.co.jp/ait/articles/1306/07/news111.html)