## Constructor in Kotlin

> コンストラクタ

Kotlin内のクラスは、 プライマリコンストラクタ と1つまたは複数の セカンダリコンストラクタ を持つことができます。プライマリコンストラクタは、クラスのヘッダーの一部です。クラス名（型パラメータをつけることもできます）の後に続きます。

```kotlin
class Person constructor(firstName: String) {
}
```
プライマリコンストラクタがアノテーションや可視性修飾子を持っていない場合は、 constructorのキーワードを省略することができます。

```kotlin
class Person(firstName: String) {
}
```
プライマリコンストラクタは、どんなコードも含めることはできません。初期化コードは、initキーワードが付いている 初期化ブロック内 に書くことができます。

```kotlin
class Customer(name: String) {
    init {
        logger.info("Customer initialized with value ${name}")
    }
}
```
プライマリコンストラクタの引数を初期化ブロックに使用できることに注意してください。クラス本体内で宣言されたプロパティの初期化処理で使用することもできます。

```kotlin
class Customer(name: String) {
    val customerKey = name.toUpperCase()
}
```
実際には、プロパティの宣言と初期化を主コンストラクタから行うために、Kotlinは簡潔な構文があります：

```kotlin
class Person(val firstName: String, val lastName: String, var age: Int) {
  // ...
}
```
通常のプロパティとほとんど同じ方法のように、プロパティは主コンストラクタの中で可変値（ミュータブル） ( var ) または固定値（イミュータブル） ( val ) で宣言することができます。

もしコンストラクタがアノテーションや可視性修飾子を持つ場合は、 constructor キーワードが必要で修飾子はその前に置かれる：

```kotlin
class Customer public @Inject constructor(name: String) { ... }
```
詳細については、可視性修飾子を参照してください。

[クラスと継承](https://dogwood008.github.io/kotlin-web-site-ja/docs/reference/classes.html#クラスと継承)
