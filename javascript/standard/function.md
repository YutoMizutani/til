## Functions

### anonymous function

無名関数

```js
const hello = function () {
	console.log("Hello");
}
hello();
```

### immediate function

即時関数

```js
(function () {
	console.log("Hello");
})(); // Hello
```

### constructor

コンストラクタ

```js
const hello = new Function("s", "return s + 'world!!'")
console.log(hello("Hello, ")); // Hello, world!!
```

### arrow function

アロー関数

```js
const ans = x => x + x
console.log(ans(5)); // 10
```

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)