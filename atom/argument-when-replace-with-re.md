## The Argument when replacing with regular expression

正規表現を行って置換を行う際の引数について。

#### Example

```
foo_bar
foo-bar
foo_baz
```

fooとbarで区切られている部分をquxとquuxに置換したい。

検索: foo(.)bar
置換: foo$1bar

ちなみに、結果は以下の通り。

```
qux_quux
qux-quux
foo_baz
```
