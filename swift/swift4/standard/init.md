## Initializer on Swift

#### `convenience initializer`

`convenience init()`にて宣言した初期化子は、他の初期化子に処理を委譲(delegate)することが可能。
初期化子の内部で初期化子を呼ぶことが可能。

[[Swift] convenienceイニシャライザとdesignated（指定）イニシャライザ](https://qiita.com/edo_m18/items/733d8c81fb00942e3167)
> convenienceの名前通り、デフォルトの処理があって、基本はそれに任せつつ、必要があれば引数を取って特別に処理をする、みたいなことを想定しているのでしょうか。

```swift
class SomeClass {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "default name")
    }
}

var aClass: SomeClass = SomeClass() // => "name: default name"
```

#### `designated initializer`

通常の初期化子。各パラメータに初期値が振られている以外の全ての場合に必須。
また、`override`で`super.init()`を呼び出す場合には、これが必要。

#### References

[[Swift] convenienceイニシャライザとdesignated（指定）イニシャライザ](https://qiita.com/edo_m18/items/733d8c81fb00942e3167)
[[Swift] クラスのイニシャライザ３： Designated Initializer と Convenience Initializer](https://qiita.com/cotrpepe/items/3052d91468f1b852582a)
