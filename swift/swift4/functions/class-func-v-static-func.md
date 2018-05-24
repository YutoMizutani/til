## class func v. static func

Swiftのclass funcとstatic funcの違い

| | class | static |
| - | - | - |
| override | 可能 | 不可能 |
| class内利用 | 可能 | 可能 |
| struct内利用 | 不可能 | 可能 |
| enum内利用 | 不可能 | 可能 |

#### 結論

overrideができない点で安全なのはstatic func。
enum等にも利用できるのもstatic func。
じゃけんstatic funcに移行しましょうね~。

でもSwiftのソースを見ているとstatic funcの採用は少ない。うーん。
挙動が違うのかもわかっていない。
コンパイル結果はわからないなぁ。調べよう。

https://tid-kijyun.github.io/2015/08/03/swift-class-func-static-func/
https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift
https://qiita.com/shimesaba/items/dc976b3974cfb41bec0c
https://github.com/apple/swift/commit/cc48aa41e458543f958c49cd27e7b9730e70393b#diff-f189c3f8e98e2dd1c326eeee82b5d991
