## Dialogs

- Alert

```js
<script>
	alert("Alert");
</script>
```

- Confirm

```js
<script>
	var ans = confirm("OK?");
	console.log(ans); // Type: Boolean
</script>
```
```js
<script>
	if (confirm("Are you sure?")) {
		// if true procedures
	}
</script>
```

- Prompt

```js
<script>
	var ans = prompt("Input?");
	console.log(ans); // if cancel then return null
</script>
```
```js
<script>
	var ans = prompt("Input?", "placeholder");
	console.log(ans);
</script>
```