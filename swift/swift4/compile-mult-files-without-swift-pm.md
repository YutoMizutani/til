## Compile multiple swift files without Swift package manager

複数のファイルをSwift PMを用いずにコンパイルする。

```swift
// main.swift
import Foundation

let hello = Hello()
print(hello.hello())
```

```swift
// hello.swift
import Foundation

struct Hello {
    func hello() -> String {
        return "Hello, world!!"
    }
}
```

```sh
$ xcrun -sdk macosx swiftc -o main main.swift hello.swift
```

[分割コンパイル](https://www.beginning-swift.com/compile-separate-source)
