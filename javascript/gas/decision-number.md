## Decision number in GAS

```js
console.log(isFinite(40)); // true
console.log(isFinite(NaN)); // false
console.log(isFinite(undefined)) // false
console.log(isFinite('1aaa')) // false
console.log(isFinite([54, 12])) // false
console.log(isFinite({hoho : 12})) // false
console.log(isFinite(Infinity)); // false
```

`isNaN`はオブジェクトの中身が数値かを判定する。

```js
console.log(isNaN(undefined)) // true
console.log(isNaN('1aaa')) // true
console.log(isNaN([54, 12])) // true
console.log(isNaN({hoho : 12})) // true
```

[通常の数値かどうかはisNaN関数じゃなくてisFinite関数Add](http://d.hatena.ne.jp/sandai/20100206/p1)
