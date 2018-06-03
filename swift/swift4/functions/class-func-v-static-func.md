# class func v. static func in Swift4

Keywords: Swift, swift4, SIL, assembly

## はじめに

新社会人2ヶ月目の新米エンジニアです。

Swiftのclass funcとstatic funcの違いについて簡単に調べてみました。

(2018/06/03 finalによる速度の違いであることが判明しましたので,追記させていただきました。)

## 機能差

*class func* はclass内でしか呼び出せない一方で，*override* が使用可能です。
*static func* は *override* ができない一方で，*struct* や *enum* でも使用可能です。

| | class | static |
|---|---|---|
| override | 可能 | 不可能 |
| class内利用 | 可能 | 可能 |
| struct内利用 | 不可能 | 可能 |
| enum内利用 | 不可能 | 可能 |

## *class func* == *final static func* ?

色々と調べていたところ，

[What is the difference between static func and class func in Swift?](https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift) に
> static func is same as final class func

という記述，また，

[Swiftのclass funcとstatic funcの違い](https://tid-kijyun.github.io/2015/08/03/swift-class-func-static-func/) にも，
> static func は final class func と同義

といった記述を見つけました。
これはコードレベルで同一のものを吐き出すのでしょうか？

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

```class-func.swift
class Main {
    class func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

```static-func.swift
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

static funcはgeneric functionから直接呼び出しをしている。

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
コンパイルオプションはデフォルトを指定(`swiftc -emit-bc -O`や`llc -O3`は無意味であった)。

```final-class-func.swift
class Main {
    final class func say() {
        print("Hello, world!!")
    }
}
Main.say()
```

```static-func.swift
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

SILレベルで全く同じファイルが生成された。(当たり前だが)そこから生成されるアセンブリも同一のファイルを生成した。

## ~~まとめ~~

overrideができない点で安全なのはstatic func。
enum等にも利用できるのもstatic func。
protocol指向にもstatic func
じゃけんstatic funcに移行しましょうね~。

...という簡単な話ではなかった。

*final class func* は *static func*と完全に等価であり，置換しても問題ありません。

~~*class func* は override を利用していないのであれば*final*を付ける，または*static func*に置き換えることで
パフォーマンスがアセンブリ1行レベルで向上します。~~

~~個人的にはfinalの有無は最適化(swiftc -O llc -O3)をすり抜けて挙動に影響を与えると知ることができたのも大きい。~~

## 2018/06/03 追記

> ~~*class func* は override を利用していないのであれば*final*を付ける，または*static func*に置き換えることで
パフォーマンスがアセンブリ1行レベルで向上します。~~

という話でもなく，

> ~~個人的にはfinalの有無は最適化(swiftc -O llc -O3)をすり抜けて挙動に影響を与えると知ることができたのも大きい。~~

...という簡単な話でもありませんでした。

[[Swift]動的ディスパッチを減らすことでパフォーマンスを改善](http://blog.andgenie.jp/articles/843) を読んで，
この問題はstaticとclassの問題ではないことが分かりました。

finalを使用することで，コンパイラによって動的ディスパッチが直接呼び出しになるため，処理速度が向上する，ということでした。

## <foo> class func v. final class func

と，いうことは，アクセス修飾子によってコンパイラが結果的にfinalと予測可能なように宣言すれば，finalもstaticも付けずともパフォーマンスの高いコードを生成することが可能ということが予測できます。

*private* キーワードも比較するため，init()にて呼び出すように変更します。

```swift
class Main {
    init() {
        Main.say()
    }

    <foo> class func say() {
        print("Hello, world!!")
    }
}
let _ = Main()
```

上記コードの \<foo\> の部分を様々なアクセス修飾子(private ... public)に変更してみます。

## SIL比較

*final*の有無によって変更されるため，SILのみで比較を行った。
~~internalのfinalに影響する最適化オプションが指定できたため，`Release mode`を追加した。~~

```generate.sh
swiftc -emit-silgen -wmo -O final-class-func.swift > ./sil/final-class-func.sil
swiftc -emit-silgen -wmo -O static-func.swift > ./sil/static-func.sil
swiftc -emit-silgen -wmo -O open-class-func.swift > ./sil/open-class-func.sil
swiftc -emit-silgen -wmo -O public-class-func.swift > ./sil/public-class-func.sil
swiftc -emit-silgen -wmo -O internal-class-func.swift > ./sil/internal-class-func.sil
swiftc -emit-silgen -wmo -O fileprivate-class-func.swift > ./sil/fileprivate-class-func.sil
swiftc -emit-silgen -wmo -O private-class-func.swift > ./sil/private-class-func.sil
```

```diff.sh
diff ./sil/final-class-func.sil ./sil/static-func.sil
diff ./sil/final-class-func.sil ./sil/open-class-func.sil
diff ./sil/final-class-func.sil ./sil/public-class-func.sil
diff ./sil/final-class-func.sil ./sil/internal-class-func.sil
diff ./sil/final-class-func.sil ./sil/fileprivate-class-func.sil
diff ./sil/final-class-func.sil ./sil/private-class-func.sil
```

diffで比較しても良いですが，
今回は出力されるファイル内容が分かっているため，.silファイルの43行目が`function_ref`か`class_method`かにより判別できます。

```sed.sh
sed -n 43p ./sil/final-class-func.sil
sed -n 43p ./sil/static-func.sil
sed -n 43p ./sil/open-class-func.sil
sed -n 43p ./sil/public-class-func.sil
sed -n 43p ./sil/internal-class-func.sil
sed -n 43p ./sil/fileprivate-class-func.sil
sed -n 43p ./sil/private-class-func.sil
```

#### 結果

| アクセス修飾子(+static) | finalの生成 |
|---|---|
| static func | ○ |
| open class func | × |
| public class func | × |
| internal class func | × |
| fileprivate class func | × |
| private class func | × |

変換してくれていない。swiftcのみでは最適化してくれていない可能性が浮上した。

## 逆アセンブル

> ~~internalのfinalに影響する最適化オプションが指定できたため，`Release mode`を追加した。~~

少し確認したところ， [Swift Compiler Performance](https://github.com/apple/swift/blob/master/docs/CompilerPerformance.md) によると
どうやら，Release modeのビルドは`Xcodebuild`を用いて行う様子。

また，Swift3よりデフォルトのアクセス修飾子に`open`が追加され，モジュール外からのoverrideは明示的に行う必要がでてきました。
と，いうことは，Release modeにてBuildを実施した場合，コンパイラは`open`以外の全てをfinalと予測することができると予想できます。

```
xcrun swiftc -wmo -O ./final-class-func.swift
xcrun swiftc -wmo -O ./static-func.swift
xcrun swiftc -wmo -O ./open-func.swift
xcrun swiftc -wmo -O ./public-class-func.swift
xcrun swiftc -wmo -O ./internal-class-func.swift
xcrun swiftc -wmo -O ./fileprivate-class-func.swift
xcrun swiftc -wmo -O ./private-class-func.swift
```

[Swift実行ファイルを逆アセンブルして，最適化具合を正確に把握する方法](https://qiita.com/mono0926/items/644b0ee96ad4691dc582) を参考に，[Hopper 4](https://www.hopperapp.com/)を利用して逆アセンブルを行いました。

#### 結果

| アクセス修飾子(+static) | finalの生成 |
|---|---|
| static func | ○ |
| open class func | ○ |
| public class func | ○ |
| internal class func | ○ |
| fileprivate class func | ○ |
| private class func | ○ |

先程とは相反する結果となりました。
この結果から言えることは，コンパイラが優秀(または，私の検証方法が間違っている)ということ。特にopenの挙動が不穏です。

## まとめ

*static func* と *class func* の違いを語る上で，以下4つの点に注意する必要があります。

1点目，*static func* は *final class func* と完全に等価であるということ。
2点目，*final* キーワードを付けることで呼び出しが動的ディスパッチから直接呼び出しになり，パフォーマンスが向上するということ。
3点目，privateなどのアクセス修飾子によって範囲を制限することで，コンパイラがfinalと推測して直接呼び出しに変換してくれるということ。
4点目，XcodebuildでRelease buildを行うと，コンパイラが最適化してくれるということ。

コンパイル方法によって異なったコードが吐き出されることには少し違和感を覚えました。
しかし，これが事実であればコンパイラは差分を吸収し，コーダーはあれこれ悩んでコーディングをする必要がなくなった，と言うことができます。

検証方法に誤りがある場合には是非コメント等で教えていただけますと幸いです。

## 参考

[What is the difference between static func and class func in Swift?](https://stackoverflow.com/questions/25156377/what-is-the-difference-between-static-func-and-class-func-in-swift)
[Swiftのclass funcとstatic funcの違い](https://tid-kijyun.github.io/2015/08/03/swift-class-func-static-func/)
[【Swift】classとstaticの挙動の違いを整理する](https://qiita.com/shimesaba/items/dc976b3974cfb41bec0c)
[Merge pull request #15151 from ikesyo/stdlib-public-operator-static-func](https://github.com/apple/swift/commit/cc48aa41e458543f958c49cd27e7b9730e70393b#diff-f189c3f8e98e2dd1c326eeee82b5d991)
[Swift 関数の再帰呼び出しは最適化されているか LLVM](https://dev.classmethod.jp/smartphone/swift-tailcallrecursion/)
[Swift Intermediate Language (SIL)](https://github.com/apple/swift/blob/master/docs/SIL.rst#id10)
[[Swift]動的ディスパッチを減らすことでパフォーマンスを改善](http://blog.andgenie.jp/articles/843)
[class func vs static func – Reddit](https://www.reddit.com/r/swift/comments/472tfj/classfuncvsstaticfunc/)
[Taming Swift compiler bugs](http://codica.pl/2015/12/25/taming-swift-compiler-bugs/)
[Swift実行ファイルを逆アセンブルして，最適化具合を正確に把握する方法](https://qiita.com/mono0926/items/644b0ee96ad4691dc582)
[Swiftのfinalについて](https://qiita.com/shtnkgm/items/c985ab4b314b8572eccd)
[Swiftのfinal・private・Whole Module Optimizationを理解しDynamic Dispatchを減らして，パフォーマンスを向上する](https://qiita.com/mono0926/items/f5f271b7d2bde68207b2)
[Increasing Performance by Reducing Dynamic Dispatch](https://developer.apple.com/swift/blog/?id=27)
[Writing High-Performance Swift Code](https://github.com/apple/swift/blob/master/docs/OptimizationTips.rst)
[Swift Compiler Performance](https://github.com/apple/swift/blob/master/docs/CompilerPerformance.md)
[vtableの中身を見てみる](http://sugawarayusuke.hatenablog.com/entry/2018/01/08/185229)
[仮想関数テーブル](https://ja.wikipedia.org/wiki/%E4%BB%AE%E6%83%B3%E9%96%A2%E6%95%B0%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB)
[LLVM Programmer’s Manual](http://llvm.org/docs/ProgrammersManual.html)
[ビューティフルアーキテクチャ](https://books.google.co.jp/books?id=pzXkGbMibQUC&pg=PA244&lpg=PA244&dq=%E5%8B%95%E7%9A%84%E3%83%87%E3%82%A3%E3%82%B9%E3%83%91%E3%83%83%E3%83%81+%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9&source=bl&ots=A7nKjTWxUe&sig=hRgYLTb2JgHuuWrAqxNrlYtp8C0&hl=ja&sa=X&ved=0ahUKEwjxs7Lr1KnbAhUJw7wKHcxhDfsQ6AEIQDAD#v=onepage&q=%E5%8B%95%E7%9A%84%E3%83%87%E3%82%A3%E3%82%B9%E3%83%91%E3%83%83%E3%83%81%20%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9&f=false)
[Rubyでのメタプログラミング（動的ディスパッチと動的メソッド）](https://qiita.com/yutaro1204/items/8e19ca364ecba5c67ee5)
