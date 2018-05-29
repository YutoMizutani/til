## LLVM BC

#### hello.swift

```
$ touch hello.swift
```

```swift
print("hello, world!")
```

#### LLVM IR

```
$ swiftc -emit-bc hello.swift > hello.bc
```

[Swiftの中間言語を出力して読む方法](https://qiita.com/S_Shimotori/items/8cdf482952385ed8472e)
