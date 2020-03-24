## Get total lines with extension

```sh
find . -name "*.swift" | xargs -I {} sh -c "cat {} | wc -l" | sed -e 's/  */ /g' | awk '{s += $1} END {print s}'
```

[ファイル行数のみを "wc -l" で取りたければ cat するのが簡単？](https://qiita.com/wyamamo/items/bc23a3f8cce2cff1babb)
[いろんなスクリプトでワンライナー足し算](https://qiita.com/ftakao2007/items/89a3ac707ad65f0b076e)
[awk で気軽に集計](https://qiita.com/kitsuyui/items/3647bd5b8a5b3e858d3c)
