## SIL

#### hello.swift

```
$ touch hello.swift
```

```swift
print("hello, world!")
```

#### SIL

```
$ swiftc -emit-silgen hello.swift > hello.sil
```

#### Run

```
$ swiftc -parse-sil hello.sil
./hello
```

[Swiftの中間言語を出力して読む方法](https://qiita.com/S_Shimotori/items/8cdf482952385ed8472e)
