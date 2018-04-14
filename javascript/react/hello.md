## Hello, world!!

Hello, world written in React.js

### Directory structure

/<br>
├ css/<br>
│   └ style.css<br>
└ index.html<br>

### index.html

```html
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Hello React</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
    <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
</head>
<body>
    <div id="root"></div>
    <script type="text/babel">
    (() => {
		ReactDOM.render(
		  <h1>Hello, world!</h1>,
		  document.getElementById('root')
		);
    })();
    </script>
</body>
</html>

```

### References

[https://qiita.com/okumurakengo/items/49b53ce0fecc18cce853](https://qiita.com/okumurakengo/items/49b53ce0fecc18cce853)

[https://reactjs.org/docs/try-react.html](https://reactjs.org/docs/try-react.html)

[https://raw.githubusercontent.com/reactjs/reactjs.org/master/static/html/single-file-example.html](https://raw.githubusercontent.com/reactjs/reactjs.org/master/static/html/single-file-example.html)

[https://codepen.io/gaearon/pen/rrpgNB?editors=0010](https://codepen.io/gaearon/pen/rrpgNB?editors=0010)