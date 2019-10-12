## Match regex

```sh
tel='09012345678'

if [[ $tel =~ [0-9]{3}-?[0-9]{4}-?[0-9]{4} ]]; then
  echo match
fi
```

[bashでif に正規表現を使った文字列マッチ条件分岐](https://takuya-1st.hatenablog.jp/entry/2016/12/22/175514)
