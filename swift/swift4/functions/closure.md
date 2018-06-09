## Closures

#### シンプルな例

```swift
let closure = { () -> () in
    print("Hello, world!!")
}
closure()
```

#### 引数

```swift
let closure = { (str: String) -> () in
    print(str)
}
closure("Hello, world!!")
```

#### 戻り値

```swift
let closure = { () -> String in
    return "Hello, world!!"
}
closure()
```

#### 即時実行

```swift
let closure = {
    return $0 * 2
}(2)
print(closure) // 4
```


[【Swift 3】関数内で非同期処理を行った後の値を返り値としたかった話【クロージャ】](https://uruly.xyz/swift3closure_gcd_1/)
[SwiftでClosureを即時実行するtips](https://blog.sgr-ksmt.org/2016/02/15/swift_closure_immediately/)

