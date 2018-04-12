## metadata in Word

### Issue

作成したwordファイルをAdoveのpdfで開くと変なタイトルが出現する。

### Solve

wordはpandas等で開かないと内部を見れないことを知っていたため、.pdfを開く。
`hogehoge`で検索した場合、dc:titleタグ内に発見。ググって解決。


```
<dc:title><rdf:Alt><rdf:li xml:lang="x-default">hogehoge</rdf:li></rdf:Alt></dc:title>
```

[source1](https://www.google.co.jp/search?q=%3Cdc%3Atitle%3E%3Crdf%3AAlt%3E%3Crdf%3Ali+xml%3Alang%3D%22x-default%22%3E&ie=&oe=)
[source2](http://blog.martinfenner.org/2015/03/20/metadata-in-microsoft-word-documents/)
[source3](https%3A%2F%2Fsupport.office.com%2Fja-jp%2Farticle%2Foffice-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E3%83%97%E3%83%AD%E3%83%91%E3%83%86%E3%82%A3%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%BE%E3%81%9F%E3%81%AF%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B-21d604c2-481e-4379-8e54-1dd4622c6b75%23viewcreate16)
