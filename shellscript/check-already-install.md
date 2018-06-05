## Check state of already install in SchellScript

> typeコマンドを利用し、コマンドに関する情報を表示します。

```sh
if type <foo> >/dev/null 2>&1; then
 # If already installed, do here.
fi
```

> 先頭に`!`をつけることで、存在していないことをチェックします。

```sh
if ! type <foo> >/dev/null 2>&1; then
 # If not installed, run install code here.
fi
```

[これだけ覚えておけばOK！シェルスクリプトで冪等性を担保するためのTips集](https://qiita.com/yn-misaki/items/3ec0605cba228a7d5c9a)
