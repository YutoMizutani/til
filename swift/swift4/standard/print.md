References

https://developer.apple.com/documentation/swift/1541053-print
https://books.google.co.jp/books?id=VGrICgAAQBAJ&pg=PA179&lpg=PA179&dq=swift+%E6%A8%99%E6%BA%96%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA+%E6%97%A5%E6%9C%AC%E8%AA%9E&source=bl&ots=sE6fd_O4xa&sig=Vk7sEyL1ci98OaSZYfP-pHcNe4Q&hl=ja&sa=X&ved=0ahUKEwjH1-nAiMzXAhWJybwKHTt-DycQ6AEIXjAJ#v=onepage&q=swift%20%E6%A8%99%E6%BA%96%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%20%E6%97%A5%E6%9C%AC%E8%AA%9E&f=false

# print 関数について

## ・はじめに
Swiftには
    private let num:Int = 1
    print("Number: \(num)")
で "Number: 1" と出力される。便利。

（2017/11/18現在）C++を始めた。
    std::cout << "Hello, World!" << std::endl;
・・・長い。
最初と最後の両方に記述があるのが嫌。憎きHTMLを想起させる。
なので，C++でSwiftのようなprint関数を実装できないかな，と考えた。
Swiftはオープンソースって聞いた。なら，どこかに書いてあるよね。

ついでに，
    print("Hello, world!!")
    print(1)
のように，複数の型を扱うのにジェネリクスという機能がある，ということはなんとなく聞いたことがある。

では，やってみよう。

・まずは公式リファレンスから。----------------------------------------------------------------------
https://developer.apple.com/documentation/swift/1541053-print

Function
print(_:separator:terminator:)
    Writes the textual representations of the given items into the standard output.
    指定された項目のテキスト表現を標準出力に書き込みます。

Declaration
    宣言
    func print(_ items: Any..., separator: String = default, terminator: String = default)

Parameters
items
    Zero or more items to print.
separator
    A string to print between each item. The default is a single space (" ").
    （ここを指定すると例えばarrayのprint時にprint(array, separator=", ")とすれば", "で区切ってくれる。）
terminator
    The string to print after all items have been printed. The default is a newline ("\n").
    （終端文字。Swiftはprintln, printをここの引数によって自由に変更できるようにしているみたい。）

次。--------------------------------------------------------------------------------------------------------------
https://developer.apple.com/documentation/swift/1641736-print

Generic Function
print(_:separator:terminator:to:)
    Writes the textual representations of the given items into the given output stream.

Declaration
    func print<Target>(_ items: Any...,
                        separator: String = default,
                        terminator: String = default,
                        to output: inout Target)
                    where Target : TextOutputStream

Parameters
items
    Zero or more items to print.
separator
    A string to print between each item. The default is a single space (" ").
terminator
    The string to print after all items have been printed. The default is a newline ("\n").
output
    An output stream to receive the text representation of each item.

Discussion
    You can pass zero or more items to the print(_:separator:terminator:to:) function. The textual representation for each item is the same as that obtained by calling String(item). The following example prints a closed range of integers to a string:
        var range = "My range: "
        print(1...5, to: &range)
        // range == "My range: 1...5\n"
    （toの引数にポインタを指定すると，Stringで追加することができる。）

Protocol
TextOutputStream
    A type that can be the target of text-streaming operations.

Overview
    You can send the output of the standard library’s print(_:to:) and dump(_:to:) functions to an instance of a type that conforms to the TextOutputStream protocol instead of to standard output. Swift’s String type conforms to TextOutputStream already, so you can capture the output from print(_:to:) and dump(_:to:) in a string instead of logging it to standard output.
        var s = ""
        for n in 1...5 {
            print(n, terminator: "", to: &s)
        }
        // s == "12345"
    （ここから，toに出力先を指定することができるとある。）


・GitHubから。----------------------------------------------------------------------------------------
https://github.com/apple/swift/blob/89c4ab0bb0de3d3aaf92f15c294c2db17a06040e/test/Interpreter/nested_generics.swift

// RUN: %empty-directory(%t)
// RUN: %target-build-swift %s -o %t/a.out
// RUN: %target-run %t/a.out | %FileCheck %s
// REQUIRES: executable_test
protocol MyPrintable {
  func print()
}

extension Int : MyPrintable {
  func print() {
    Swift.print(self, terminator: "")
  }
}

extension String : MyPrintable {
  func print() {
    Swift.print(self, terminator: "")
  }
}

extension Array : MyPrintable {
  func print() {
    Swift.print(self, terminator: "")
  }
}

class Foo<T : MyPrintable> {
  init<U : MyPrintable>(_ t: T, _ u: U) {
    print("init ", terminator: "")
    t.print()
    print(" ", terminator: "")
    u.print()
    print("")
  }

  func bar<U : MyPrintable>(_ u: U) {
    print("bar ", terminator: "")
    u.print()
    print("")
  }
}

// CHECK: init 1 two
// CHECK: bar [1]
var foo = Foo<Int>(1, "two")
foo.bar([1])

struct OuterStruct<T : MyPrintable> {
  let t: T

  struct InnerStruct<U : MyPrintable> {
    let u: U

    func printBoth(t: T) {
      t.print()
      print(" ", terminator: "")
      u.print()
    }

    static func printBoth(t: T, u: U) {
      t.print()
      print(" ", terminator: "")
      u.print()
    }

    func printAllThree<V : MyPrintable>(t: T, v: V) {
      printBoth(t: t)
      print(" ", terminator: "")
      v.print()
    }
  }

  class InnerClass<U : MyPrintable> {
    let u: U

    init(u: U) {
      self.u = u
    }

    func printBoth(t: T) {
      t.print()
      print(" ", terminator: "")
      u.print()
    }

    static func printBoth(t: T, u: U) {
      t.print()
      print(" ", terminator: "")
      u.print()
    }

    func printAllThree<V : MyPrintable>(t: T, v: V) {
      printBoth(t: t)
      print(" ", terminator: "")
      v.print()
    }
  }
}

class SubClass<X : MyPrintable, Y : MyPrintable> : OuterStruct<Y>.InnerClass<X> {
  override func printBoth(t: Y) {
    print("override ", terminator: "")
    super.printBoth(t: t)
  }

  // FIXME: Does not work!
  /* override func printAllThree<Z : MyPrintable>(t: Y, v: Z) {
    print("super ", terminator: "")
    super.printAllThree(t: t, v: v)
  } */
}

// CHECK: 1 two
// CHECK: 1 two
// CHECK: 1 two [3]
OuterStruct<Int>.InnerStruct<String>(u: "two").printBoth(t: 1)
OuterStruct<Int>.InnerStruct<String>.printBoth(t: 1, u: "two")
OuterStruct<Int>.InnerStruct<String>(u: "two").printAllThree(t: 1, v: [3])

// CHECK: override 1 two [3]
SubClass<String, Int>(u: "two").printAllThree(t: 1, v: [3])
