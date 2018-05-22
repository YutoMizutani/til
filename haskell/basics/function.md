## Define function on GHCi

GHCi環境で.hsファイルを読み込み、関数を実行する。

```
$ vi baby.hs
```

```hs
doubleMe x = x + x
```

```
$ ghci
Prelude> :l baby
*Main> doubleMe 9
18
```
