## Array (List)

ObjectのArrayをRealmで実現するにはList<foo>で繋いであげる必要がある。

```swift
class CommentsModel: Object {
    dynamic var message = ""
}

let messages = List<CommentsModel>()
```

[Realm - Property cannot be marked dynamic because its type cannot be represented in Objective-C](https://stackoverflow.com/questions/40925192/realm-property-cannot-be-marked-dynamic-because-its-type-cannot-be-represented)
