## class func v. static func

Swiftのclass funcとstatic funcの違い

## 機能差

*class func* はclass内でしか呼び出せない一方で、*override* が可能。
*static func* は *override* ができない一方で、*struct* や *enum* でも使用可能。

| | class | static |
| - | - | - |
| override | 可能 | 不可能 |
| class内利用 | 可能 | 可能 |
| struct内利用 | 不可能 | 可能 |
| enum内利用 | 不可能 | 可能 |

## *class func* == *final static func* ?

色々と調べていたところ、

[What is the difference between static func and class func in Swift?](https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift) に
> static func is same as final class func

また、 [Swiftのclass funcとstatic funcの違い](https://tid-kijyun.github.io/2015/08/03/swift-class-func-static-func/) にも、
> static func は final class func と同義

といった記述が存在した。
これはコードレベルで同一のものを吐き出すのだろうか？

## アセンブリ比較

### class func v. static func (コンパイルオプション: Default)

class funcとstatic funcが共に使用可能なclassでの比較を行った。
比較対象は普段のコーディングを想定し、 *class func* と *static func* とする。
各Main classに"Hello, world!!"を出力するfunctionを用意し、swiftcでアセンブリを生成する。
コンパイルオプションはデフォルトを指定。

#### 1. class-func.swift

```swift
class Main {
    class func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

#### 2. static-func.swift

```swift
class Main {
    static func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

#### 3. assemblyの生成

実際にはこの間にgit commitして差分がとれるようにしている。
(そのまま上書きしようとするとエラーが発生する)

```
$ swiftc -emit-assembly class-func.swift > o.s
$ swiftc -emit-assembly static-func.swift > o.s
```

#### 4. git diffで確認

```
$ git diff 3e0426 81038b
diff --git a/o.s b/o.s
index 41e495f..ccbe23f 100644
--- a/o.s
+++ b/o.s
@@ -385,7 +385,7 @@ l___unnamed_4:
 __T04main4MainCMn:
        .long   l___unnamed_3-__T04main4MainCMn
        .long   0
-       .long   12
+       .long   11
        .long   (l___unnamed_4-__T04main4MainCMn)-12
        .long   (l_get_field_types_Main-__T04main4MainCMn)-16
        .long   0
@@ -397,10 +397,8 @@ __T04main4MainCMn:
        .short  4
        .long   0
        .long   10
-       .long   2
-       .long   (__T04main4MainC3sayyyFZ-__T04main4MainCMn)-56
-       .long   0
-       .long   (__T04main4MainCACycfc-__T04main4MainCMn)-64
+       .long   1
+       .long   (__T04main4MainCACycfc-__T04main4MainCMn)-56
        .long   1

 .zerofill __DATA,__bss,__T04main4MainCML,8,3
@@ -419,11 +417,10 @@ __T04main4MainCMf:
        .long   16
        .short  7
        .short  0
-       .long   112
+       .long   104
        .long   16
        .quad   __T04main4MainCMn
        .quad   0
-       .quad   __T04main4MainC3sayyyFZ
        .quad   __T04main4MainCACycfc

        .section        __TEXT,__swift3_typeref,regular,no_dead_strip
```

出力されたアセンブリを見てみると、
*static func* が1行分だけ処理が短くなっている。

## まとめ

overrideができない点で安全なのはstatic func。
enum等にも利用できるのもstatic func。
じゃけんstatic funcに移行しましょうね~。

処理はデフォルトでは*static func*が高速。
一方で、最適化後はどうなるのだろうか。

## 参考

[What is the difference between static func and class func in Swift?](https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift)

[Swiftのclass funcとstatic funcの違い](https://tid-kijyun.github.io/2015/08/03/swift-class-func-static-func/)

[【Swift】classとstaticの挙動の違いを整理する](https://qiita.com/shimesaba/items/dc976b3974cfb41bec0c)

[Merge pull request #15151 from ikesyo/stdlib-public-operator-static-func](https://github.com/apple/swift/commit/cc48aa41e458543f958c49cd27e7b9730e70393b#diff-f189c3f8e98e2dd1c326eeee82b5d991)

[Swift 関数の再帰呼び出しは最適化されているか LLVM](https://dev.classmethod.jp/smartphone/swift-tailcallrecursion/)
