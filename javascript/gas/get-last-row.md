## Get last row in GAS

シートの最終行を取得するスクリプト

```js
// sheetの最終行を返す
// - Parameters:
//   - sheet: Sheet
// - Return: Integer
function getLastRow(sheet) {
  return sheet.getLastRow();
}
```

指定した範囲の最終行を取得することも可能。

```js
// sheetの最終行を返す
// - Parameters:
//   - range: Range
// - Return: Integer
function getLastRow(range) {
  return sheet.getLastRow();
}
```

[[GAS][スプレッドシート]シートの最終行を取得するには: 逆引きGoogle Apps Script](http://www.bmoo.net/archives/2012/03/313118.html)
