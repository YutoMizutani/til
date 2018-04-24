## setup

### Isntall node

### install electron
```
$ cd (project)
$ npm init -y
$ npm install electron --save-dev
```

### Add script
Add start command
Open *package.json*,
```
...
  "scripts": {
    "start": "electron index.js",
...
```
[https://teratail.com/questions/12675](https://teratail.com/questions/12675)

### Hello
```
$ touch index.js
```

index.js

```js
'use strict';

const electron = require('electron');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;

let mainWindow;

function createMainWindow() {
    // create window
    mainWindow = new BrowserWindow({width: 600, height: 400});
    mainWindow.loadURL('file://' + __dirname + '/index.html');
    // Display error (DEBUG)
    // mainWindow.webContents.openDevTools();
    // Break the window when closed
    mainWindow.on('closed', function() {
       mainWindow = null;
    });
}

app.on('ready', function() {
    createMainWindow();
});
```

index.html

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title>Hello!</title>
</head>
<body>
  Hello, world
</body>
</html>
```


### build

```
$ npm i electron-packager --save-dev
$ node_modules/.bin/electron -v
$ node_modules/.bin/electron-packager ./ (App name) --platform=darwin --arch=x64 --version=(electron version)
//e.g. node_modules/.bin/electron-packager ./ MyApp --platform=darwin --arch=x64 --version=v1.8.4
```

### js references
[ES6の新機能: 「let」「const」宣言を調べてみた](https://qiita.com/niisan-tokyo/items/bacb5ed98ea10831eeba)

[【JavaScript】varとfunction"文"は使わずにletとconstを使って欲しい（切実）](https://qiita.com/mejileben/items/b8502173216aebae8d36)

[や...やっと理解できた！(2) JavaScriptのスコープチェーン](http://maeharin.hatenablog.com/entry/20130313/javascript_scopechain)