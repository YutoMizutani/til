## Ad hoc polymorphism｜アドホック多相

異なるクラスに対して同一の関数を定義する。

> Ad hoc polymorphismは「関数が引数の型によって異なる実装を持つ場合のポリモーフィズム」です。
> Ad hoc polymorphismを実現するSwiftの言語機能には「関数のオーバーロード」があります。

```swift
struct Person {
    let firstName: String
    let lastName: String
}

struct Book {
    let title: String
}
```

```swift
func getName(of person: Person) -> String {
    return person.firstName + " " + person.lastName
}

func getName(of book: Book) -> String {
    return book.title
}
```

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```

[Swiftと3種類のポリモーフィズム](https://qiita.com/shtnkgm/items/fcc1a1a75895a31df4a9)
