## Ignoring errors in Makefile

[Makefile ことはじめ #エラー無視オプション](https://qiita.com/kasei-san/items/ad25df63260e86c5cc71#エラー無視オプション)
```Makefile
test: test.o
clean:
    -rm test test.o
    echo "test" # 削除の後のなんらかの処理
```

[Makefile ことはじめ #エラー無視オプション](https://qiita.com/kasei-san/items/ad25df63260e86c5cc71#エラー無視オプション)
