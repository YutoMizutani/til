## Objects

Object has multiple properties and methods.

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