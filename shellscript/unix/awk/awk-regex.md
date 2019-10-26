## AWK Regex

[AWK のフィールドセパレータの真実](https://qiita.com/ngyuki/items/c9917a9392f834ea7163)
> ２文字以上なら正規表現。

```sh
$ cat hoge.txt | awk -F'[0-9]+' '{print $1}'
aaa.
bbb.
ccc.
```

[AWK のフィールドセパレータの真実](https://qiita.com/ngyuki/items/c9917a9392f834ea7163)
