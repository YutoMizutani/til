## Objects

Object has multiple properties and methods.

オブジェクトはドット表記法とブラケット表記法でアクセスできる。

```js
var obj {
	name: "foo",
	age: 10,
	log: function(props) {
		console.log(props);
	}
};
console.log(obj["name"]);
console.log(obj.name);
obj.log(obj.name);
```

```js
// Shorthand property names (ES2015)
var a = 'foo', b = 42, c = {};
var o = {a, b, c};

// Shorthand method names (ES2015)
var o = {
  property([parameters]) {}
};

// Computed property names (ES2015)
var prop = 'foo';
var o = {
  [prop]: 'hey',
  ['b' + 'ar']: 'there'
};
```

```js
var a = "foo",
    b = 42,
    c = {};

// Shorthand property names (ES2015)
var o = { a, b, c };

// In other words,
console.log((o.a === {a}.a)); // true
```

[オブジェクト初期化子](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Object_initializer#%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%83%AA%E3%83%86%E3%83%A9%E3%83%AB%E8%A1%A8%E8%A8%98%E6%B3%95_vs_JSON)
> オブジェクトリテラル表記法は JavaScript Object Notation (JSON) とは異なります。それらは似ていますが、それらの間には違いがあります。:
>
> - JSON は、"property": value 構文を使用するプロパティ定義のみ許可します。プロパティ名称は二重引用符で囲まなければなりません。そして、その定義は簡略にすることはできません。
> - JSON ではその値は strings、numbers、arrays、true、 false、null、別の (JSON) オブジェクトのみです。
> - 関数の値 (上記"メソッド"を参照) は JSON では値を割り当てることができません。
> - Date のようなオブジェクトは JSON.parse() の後で string になります。
> - JSON.parse() は計算されたプロパティ名を拒否し、エラーがスローされます。

[オブジェクト初期化子](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Object_initializer#%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%83%AA%E3%83%86%E3%83%A9%E3%83%AB%E8%A1%A8%E8%A8%98%E6%B3%95_vs_JSON)
