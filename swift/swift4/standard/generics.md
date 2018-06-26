## Generics



https://books.google.co.jp/books?id=VGrICgAAQBAJ&pg=PA179&lpg=PA179&dq=swift+%E6%A8%99%E6%BA%96%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA+%E6%97%A5%E6%9C%AC%E8%AA%9E&source=bl&ots=sE6fd_O4xa&sig=Vk7sEyL1ci98OaSZYfP-pHcNe4Q&hl=ja&sa=X&ved=0ahUKEwjH1-nAiMzXAhWJybwKHTt-DycQ6AEIXjAJ#v=onepage&q=swift%20%E6%A8%99%E6%BA%96%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%20%E6%97%A5%E6%9C%AC%E8%AA%9E&f=false

```swift
class IntPair {
    let val1:Int
    let val2:Int

    init(val1:Int, val2:Int) {
        self.val1 = val1
        self.val2 = val2
    }
}
let pair = IntPair(val1: 10, val2: 15)
print(pair.val1)
print(pair.val2)


// TはTypeのT(T, U, V, ...)
func myFunction<T>(param:T) -> T {
    return param
}

// Comparable
class Pair<T:Comparable> {
    let val1:T
    let val2:T

    var minValue:T {
        get{
            return (val1 < val2) ? val1 : val2
        }
    }
    var maxValue:T {
        get{
            return (val1 > val2) ? val1 : val2
        }
    }

    init(val1:T, val2:T) {
        self.val1 = val1
        self.val2 = val2
    }
}

// where
func appendQueue<Q1:Queue, Q2:Queue where Q1.ItemType == Q2.ItemType>
    (inout queue:Q1, inout append:Q2) {
    let length = append.count
    for _ in 0..<length {
        queue.append(append.shift())
    }
}
```
