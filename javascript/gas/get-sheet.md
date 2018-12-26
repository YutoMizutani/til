## Get SpreadsheetApp in GAS

```js

/// 対象のシート名
var proceedSheetByName = 'シート1';

// proceedSheetByName に書かれたシートを返す
// - Return: Sheet
function getProceedSheet() {
  if (getProceedSheet.sheet) { return getProceedSheet.sheet; }

  getProceedSheet.sheet = SpreadsheetApp.getActive().getSheetByName(proceedSheetByName);
  return getProceedSheet.sheet;
}
```

#### シートを名前で指定して取得

```js
var sheet = spreadsheet.getSheetByName('<シート名>');
```

#### 何番目のシートかを数字で指定して取得

```js
var sheet = spreadsheet.getSheets()[0];
```

[GASでSpreadsheetを操作する自分的ベストプラクティス](https://qiita.com/ryan5500/items/e72eb205fbe006c2eb6f)
