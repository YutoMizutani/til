## Get Range in GAS

1セル

```js
// Cellを取得する
// - Parameters:
//   - column: String
//   - row: Number
// - Return: String
function getCell(column, row) {
  return column + String(row);
}
```

複数セル

```js
// Rangeを取得する
// - Parameters:
//   - column: String
//   - min: Integer
//   - max: Integer
// - Return: String
function getRange(column, min, max) {
  return column + String(min) + ':' + column + String(max);
}
```

#### Usage

```js
sheet.getRange(getCell('F', 1));
sheet.getRange(getRange('C', 1, 10));
```

#### all

```js
function myFunction() {
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = spreadsheet.getActiveSheet();
  var range = sheet.getRange("A1");//セルA1を取得
  var range = sheet.getRange(1, 1);//セルA1を取得
  var range = sheet.getRange(1, 1, 3);//セルA1:A3を取得
  var range = sheet.getRange(1, 1, 3, 2);//セルA1:B3を取得
}
```

[【Google Apps Script入門】セルの取得・変更をする](http://uxmilk.jp/25841)
