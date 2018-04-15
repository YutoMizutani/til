## Timer

- setInterval
- setTimeout

### setInterval

前の処理が終わったかを考慮しない。

```js
var i = 0;
function show() {
	console.log(i++);
}
setInterval(function() {
	show();
}, 1000); // loop
```

### setTimeout

setTimeoutは1度のみ実行される。一方で，処理が終わったかを考慮する。<br>
	-> setIntervalのクラッシュを防ぐためループにして使用する。

```js
var i = 0;
function show() {
	console.log(i++);
}
setTimeout(function() {
	show();
}, 1000); // Run once
```
```js
var i = 0;
function show() {
	console.log(i++);
	setTimeout(function() {
		show();
	}, 1000);
}
```

if breaking,

```js
var i = 0;
function show() {
	console.log(i++);
	var timeout = setTimeout(function() {
		show();
	}, 1000);
	if (i > 5) {
		clearTimeout(timeout);
	}
}
```