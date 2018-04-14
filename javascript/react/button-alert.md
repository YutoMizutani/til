## Button induced alert

Button tutorial in React.js

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

        function Alert(props) {
            let text = "Hello, "+ props + "!!"
            alert(text);
        }

        function GetButton(props) {
            return (
                <button onClick={() => Alert(props.button.title)}>
                    {props.button.title}
                </button>
            );
        }

        class Hello extends React.Component {
            constructor() {
                super();
                this.state = {
                    button: {title: 'ReactButton', text: 'kakeragame'}
                };
            }
            countUp(counter) {
                this.setState(prevState => {
                    const counters = prevState.counters.map(counter => {
                        return {id: counter.id, count: counter.count, color: counter.color};
                    });
                    const pos = counters.map(counter => {
                        return counter.id;
                    }).indexOf(counter.id);
                    counters[pos].count++;
                    return {
                        counters: counters,
                        total: prevState.total + 1
                    };
                });
            }
            render() {
                return (
                    <GetButton
                        button={this.state.button}
                    />
                );
            }
        }

        ReactDOM.render(
            <Hello/>,
            document.getElementById('root')
        );
    })();
    </script>
</body>
</html>

```

### style.css

```css
button {
    width: 200px;
    height: 100px;
    line-height: 100px;
    text-align: center;
    cursor: pointer;
    user-select: none;
    border-radius: 5px;
    margin: 0 5px 10px;
}
```