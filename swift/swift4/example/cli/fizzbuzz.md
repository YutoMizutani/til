## FizzBuzz on Swift4

```swift
let array: [Int] = (1...100).map{ $0 }
array.forEach {
    if $0 % (3 * 5) == 0 {
        print("FizzBuzz")
    }else if $0 % 3 == 0 {
        print("Fizz")
    }else if $0 % 5 == 0 {
        print("Buzz")
    }else{
        print($0)
    }
}
```
