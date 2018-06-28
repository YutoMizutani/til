## Compile multiple swift files without Swift Package Manager

複数のファイルをSwift PMを用いずにコンパイルする。

```swift
// main.swift
import Foundation

let hello = Hello()
hello.say()
```

```swift
// hello.swift
import Foundation

struct Hello {
    func say() {
        print("Hello, world!!")
    }
}
```

```sh
$ xcrun -sdk macosx swiftc -o main main.swift hello.swift
```

## One liner

```sh
cat << 'EOT' > main.swift
import Foundation

let hello = Hello()
hello.say()
EOT

cat << 'EOT' > hello.swift
import Foundation

struct Hello {
    func say() {
        print("Hello, world!!")
    }
}
EOT

xcrun -sdk macosx swiftc -o main main.swift hello.swift
./main
```

## References

[分割コンパイル](https://www.beginning-swift.com/compile-separate-source)
