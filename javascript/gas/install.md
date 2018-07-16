## Install(apply) Google Apps Script

> ## 実行方法1 エディタから実行
> Google Apps ScriptはGoogleスプレッドシートのメニューのツール → スクリプトエディタを開いてエディタにコードを記述する。
>
> 記述したコードはエディタから実行する場合は三角(▶)の実行ボタンを押すか、「実行 → 関数を実行」から実行できる。
> ```js
> // 実行するスクリプト
> function myFunction() {
>   Browser.msgBox('Hello world!');
> }
> ```
> ただし、Google Apps Scriptは主にGoogleスプレッドシートの操作に使用するため、エディタから実行するケースはデバッグ以外では少ない。

> また、初回実行時はスクリプト実行の承認を求められるので自分のGoogleアカウントを選択する。
> 「このアプリは確認されていません」と表示された場合は「詳細」をクリックしてsample（安全ではないページ）に移動をクリックして、再度自分のGoogleアカウントを選択すればスクリプトを実行できるようになる。
> ![google-spreadsheet-apps-script-program-execute-comfirm.png](https://iwb.jp/wp-content/uploads/2018/01/google-spreadsheet-apps-script-program-execute-comfirm.png)

> ## 実行方法2 ボタンを配置して実行
> Googleスプレッドシートではメニューの「挿入」から図形描画や画像を挿入することでボタンを配置できる。
>
> 配置したボタンは選択すると右上に「・・・」が表示されるため、これをクリックして「スクリプトを割り当て」を選択して関数名(myFunctionなど)を設定すれば割り当てた関数を実行できるようになる。

> ## 実行方法3 メニューを追加して実行
> Googleスプレッドシートではメニューの「ヘルプ」の右にスクリプトを実行するためのメニューを追加できる。
>
> 例えば「メッセージ表示」というメニューを追加して「Hello world! 実行」をクリックすると関数が実行されるようにしたい場合は以下のようなコードになる。
> ```js
> // 関数を実行するメニューを追加
> function onOpen() {
>   var ui = SpreadsheetApp.getUi();
>   var menu = ui.createMenu('メッセージ表示');
>   menu.addItem('Hello world! 実行', 'myFunction');
>   menu.addItem('Hello world! 2 実行', 'myFunction2');
>   menu.addToUi();
> }
>
> function myFunction() {
>   Browser.msgBox('Hello world!');
> }
> function myFunction2() {
>   Browser.msgBox('Hello world! 2');
> }
> ```

[Googleスプレッドシート Apps Scriptの3つのプログラム実行方法](https://iwb.jp/google-spreadsheet-apps-script-program-execute/)
[Google Apps Scriptでスプレッドシートにアクセスする](http://cly7796.net/wp/other/access-google-spreadsheets-with-google-apps-script/)
[Google Apps Scriptプログラミングでスプレッドシートを操作するための基礎知識 (2/2)](http://www.atmarkit.co.jp/ait/articles/1701/18/news025_2.html)
[【Google Apps Script入門】Google Apps Scriptとは？](http://uxmilk.jp/25775)
