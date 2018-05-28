## class func v. static func

新社会人2ヶ月目の新米エンジニアです。

Swiftのclass funcとstatic funcの違いについて調べてみました。

## 機能差

*class func* はclass内でしか呼び出せない一方で，*override* が可能。
*static func* は *override* ができない一方で，*struct* や *enum* でも使用可能。

| | class | static |
| - | - | - |
| override | 可能 | 不可能 |
| class内利用 | 可能 | 可能 |
| struct内利用 | 不可能 | 可能 |
| enum内利用 | 不可能 | 可能 |

## *class func* == *final static func* ?

色々と調べていたところ，

[What is the difference between static func and class func in Swift?](https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift) に
> static func is same as final class func

また，

[Swiftのclass funcとstatic funcの違い](https://tid-kijyun.github.io/2015/08/03/swift-class-func-static-func/) にも，
> static func は final class func と同義

といった記述が存在した。
これはコードレベルで同一のものを吐き出すのだろうか？

## 準備

#### version

```
$ swiftc -v
Apple Swift version 4.1 (swiftlang-902.0.48 clang-902.0.37.1)
Target: x86_64-apple-darwin17.5.0
```

### class func v. static func

class funcとstatic funcが共に使用可能なclassでの比較を行った。
比較対象は普段のコーディングを想定し， *class func* と *static func* とする。
各Main classに"Hello, world!!"を出力するfunctionを用意し，swiftcでアセンブリを生成する。
コンパイルオプションはデフォルトを指定(`swiftc -emit-bc -O`や`llc -O3`は無意味であった)。

#### class-func.swift

```swift
class Main {
    class func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

#### static-func.swift

```swift
class Main {
    static func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

## SIL比較

#### silの生成

```
$ swiftc -emit-silgen class-func.swift > class-func.sil
$ swiftc -emit-silgen static-func.swift > static-func.sil
```

#### 確認

```
diff class-func.sil static-func.sil
@@ -7,8 +7,9 @@ import SwiftShims
 // main
 sil @main : $@convention(c) (Int32, UnsafeMutablePointer<Optional<UnsafeMutablePointer<Int8>>>) -> Int32 {
 bb0(%0 : $Int32, %1 : $UnsafeMutablePointer<Optional<UnsafeMutablePointer<Int8>>>):
-  %2 = metatype $@thick Main.Type                 // users: %4, %3
-  %3 = class_method %2 : $@thick Main.Type, #Main.say!1 : (Main.Type) -> () -> (), $@convention(method) (@thick Main.Type) -> () // user: %4
+  %2 = metatype $@thick Main.Type                 // user: %4
+  // function_ref static Main.say()
+  %3 = function_ref @_T04main4MainC3sayyyFZ : $@convention(method) (@thick Main.Type) -> () // user: %4
   %4 = apply %3(%2) : $@convention(method) (@thick Main.Type) -> ()
   %5 = integer_literal $Builtin.Int32, 0          // user: %6
   %6 = struct $Int32 (%5 : $Builtin.Int32)        // user: %7
@@ -117,7 +118,6 @@ bb0(%0 : $Main):
 } // end sil function '_T04main4MainCACycfc'

 sil_vtable Main {
-  #Main.say!1: (Main.Type) -> () -> () : _T04main4MainC3sayyyFZ        // static Main.say()
   #Main.init!initializer.1: (Main.Type) -> () -> Main : _T04main4MainCACycfc   // Main.init()
   #Main.deinit!deallocator: _T04main4MainCfD   // Main.__deallocating_deinit
 }
```

class funcはMain.sayをsil_vtableで宣言し，動的ディスパッチをしている。

static funcはgeneric functionからアクセスしている。

アクセス方法が異なるだけで，class funcも
`// static Main.say()`
のコメントとともに，同じ関数が用意されている。

## アセンブリ比較

#### assemblyの生成

```
$ swiftc -emit-assembly class-func.swift > class-func.s
$ swiftc -emit-assembly static-func.swift > static-func.s
```

#### 確認

```
diff class-func.s static-func.s
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

出力されたアセンブリを見てみると，
*static func* が1行分だけ処理が短くなっている。


## final class func v. static func

次に，final class funcとstatic funcが共に使用可能なclassでの比較を行った。
比較対象は *final class func* と *static func* とする。
各Main classに"Hello, world!!"を出力するfunctionを用意し，swiftcでアセンブリを生成する。
コンパイルオプションはデフォルトを指定(`swiftc -emit-bc -O`とか`llc -O3`は無意味であった)。

#### final-class-func.swift

```swift
class Main {
    final class func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

#### static-func.swift

```swift
class Main {
    static func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

## SIL比較

#### silの生成

```
$ swiftc -emit-silgen final-class-func.swift > final-class-func.sil
$ swiftc -emit-silgen static-func.swift > static-func.sil
```

#### 確認

SILレベルで全く同じファイルが生成された。もちろんアセンブリも同様。

## まとめ

overrideができない点で安全なのはstatic func。
enum等にも利用できるのもstatic func。
protocol指向にもstatic func
じゃけんstatic funcに移行しましょうね~。

...という簡単な話ではなかった。

*final class func* は *static func*と完全に等価で，置換しても問題はない。

*class func* は override を利用していないのであれば*final*を付ける，または*static func*に置き換えることで
パフォーマンスがアセンブリ1行レベルで向上する。

個人的にはfinalの有無は最適化(swiftc -O llc -O3)をすり抜けて挙動に影響を与えると知ることができたのも大きい。

## 参考

[What is the difference between static func and class func in Swift?](https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift)

[Swiftのclass funcとstatic funcの違い](https://tid-kijyun.github.io/2015/08/03/swift-class-func-static-func/)

[【Swift】classとstaticの挙動の違いを整理する](https://qiita.com/shimesaba/items/dc976b3974cfb41bec0c)

[Merge pull request #15151 from ikesyo/stdlib-public-operator-static-func](https://github.com/apple/swift/commit/cc48aa41e458543f958c49cd27e7b9730e70393b#diff-f189c3f8e98e2dd1c326eeee82b5d991)

[Swift 関数の再帰呼び出しは最適化されているか LLVM](https://dev.classmethod.jp/smartphone/swift-tailcallrecursion/)

[Swift Intermediate Language (SIL)](https://github.com/apple/swift/blob/master/docs/SIL.rst#id10)
