## Get cell value

> ## 指定された範囲の値を１つだけ取得
> `getValue()`
> 指定された範囲にある最も左上にあるセルの値を取得します。返り値は、Number, Boolean, Date, Stringのいずれかで、セルが空の場合は空のStringとなります。 返り値 Object セルの値

> ## 指定された範囲の値を配列で取得
> `getValues()`
> 指定された範囲の値を二次元配列で返します。返り値の型は、getValue()で同様です。また、getRange()では行・列が1から始まりますが、配列のインデックスは[0][0]から始まります。 返り値 Object[][] 指定範囲の値の二次元配列

[【Google Apps Script入門】セルの取得・変更をする](http://uxmilk.jp/25841)
