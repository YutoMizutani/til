## Set value in GAS

```js
var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
var sheet = spreadsheet.getActiveSheet();
sheet.getRange('A1').setValue('foo');
```

[【Google Apps Script入門】セルの取得・変更をする](http://uxmilk.jp/25841)
