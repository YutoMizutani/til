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
$ swiftc -o main main.swift hello.swift
$ ./main
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

swiftc -o main main.swift hello.swift
./main
rm main.swift hello.swift main  # 後片付け
```

## 追記

[Swiftをコマンドラインでコンパイルする方法](http://rodhos.hatenadiary.jp/entry/2017/06/23/142512) に書かれていた。

## References

[分割コンパイル – Swiftをはじめよう！](https://www.beginning-swift.com/compile-separate-source)
[Swiftをコマンドラインでコンパイルする方法](http://rodhos.hatenadiary.jp/entry/2017/06/23/142512)
