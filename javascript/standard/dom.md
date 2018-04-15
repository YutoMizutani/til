## DOM

DOM: Document Object Model

Window自体もJavaScriptで作られている。ブラウザによって命令が異なる。

- Creation
- Actions
- Get parameters

<hr>

## Create

### Editing

```html
<body>
    <h1>Hello, world!!</h1>
    <p id="msg">Hello!</p>
    <script>
        var e = document.getElementById('msg');
        e.textContent = 'world!!';
        e.style.color = 'red';
        e.className = 'style';
    </script>
</body>
```

### Append

```html
<body>
    <h1>Hello, world!!</h1>
    <p id="msg">Hello!</p>
    <script>
        var greet = document.createElement('p'),
            text = document.createTextNode('Hello, world!!');
        document.body.appendChild(greet).appendChild(text);
    </script>
</body>
```

<hr>

## Actions

### Transition page

```js
window.location.href = 'https://google.com'
```

### Button click

```html
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="utf-8">
</head>
<body>
    <button id="add">Click!</button>
    <script>
        document.getElementById('add').addEventListener('click', function() {
                var greet = document.createElement('p'),
                    text = document.createTextNode('Hello, world!!');
                document.body.appendChild(greet).appendChild(text);
        })
    </script>
</body>
</html>
```

<hr>

## Get parameters

```js
console.dir(windows);
```

### Get height

```js
console.log(window.outerHeight);
```

### About current page

```js
console.log(window.document);
console.log(document);
```
