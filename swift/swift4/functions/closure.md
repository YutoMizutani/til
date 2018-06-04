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

[【Swift 3】関数内で非同期処理を行った後の値を返り値としたかった話【クロージャ】](https://uruly.xyz/swift3closure_gcd_1/)
