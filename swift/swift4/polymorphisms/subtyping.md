## Subtyping（部分型付け）

> Subtypingは「共通のインタフェースを持つ複数の型の異なる実装を実行する場合のポリモーフィズム」です。
> Subtypingを実現するSwiftの言語機能には「スーパークラス（継承）」と「プロトコル」があります。

#### Super class

```swift
class NamedType {
    let name: String

    init(name: String) {
        self.name = name
    }
}
```

```swift
class Person: NamedType {
    let firstName: String
    let lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(name: firstName + " " + lastName)
    }
}

class Book: NamedType {
    let title: String

    init(title: String) {
        self.title = title
        super.init(name: title)
    }
}
```

```swift
func getName(of namedType: NamedType) -> String {
    return namedType.name
}
```

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```


#### Protocol

```swift
protocol NamedType {
    var name: String { get }
}
```

```swift
struct Person: NamedType {
    let firstName: String
    let lastName: String

    var name: String {
        return firstName + " " + lastName
    }
}

struct Book: NamedType {
    let title: String

    var name: String {
        return title
    }
}
```

```swift
func getName(of namedType: NamedType) -> String {
    return namedType.name
}
```

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```

[Swiftと3種類のポリモーフィズム](https://qiita.com/shtnkgm/items/fcc1a1a75895a31df4a9)
