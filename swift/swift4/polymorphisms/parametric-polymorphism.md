## Parametric polymorphism（パラメータ多相）

> Parametric polymorphismは「特定の型を指定しない場合のポリモーフィズム」です。
> Parametric polymorphismを実現するSwiftの言語機能には「ジェネリクス（型パラメータ）」があります。

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
func getName<T>(of t: T) -> String {
    if let person = t as? Person {
        return person.firstName + " " + person.lastName
    } else if let book = t as? Book {
        return book.title
    } else {
        return ""
    }
}
```

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```

[Swiftと3種類のポリモーフィズム](https://qiita.com/shtnkgm/items/fcc1a1a75895a31df4a9)
