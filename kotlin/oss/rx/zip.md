## zip

```kotlin
Singles.zip(hoge(1), hoge(2))
```

```kotlin
import io.reactivex.Single
import io.reactivex.functions.BiFunction
import io.reactivex.functions.Function3

fun main(args: Array<String>) {
    // 2つのデータを問い合わせて、揃ったら表示
    Single.zip(hoge(1),
            hoge(2),
            BiFunction<Int, Int, Pair<Int, Int>> { n1, n2 -> Pair(n1, n2) })
            .subscribe(
                    { pair -> println("${pair.first}, ${pair.second}") }
            )

    // 3つのデータを問い合わせて、揃ったら表示
    Single.zip(hoge(1),
            hoge(2),
            hoge(3),
            Function3<Int, Int, Int, Triple<Int, Int, Int>> { n1, n2, n3 -> Triple(n1, n2, n3) })
            .subscribe(
                    { triple -> println("${triple.first}, ${triple.second}, ${triple.third}") }
            )
}

// n秒待ってSingleでnを返す
// (APIやDBからの取得メソッドを想定)
fun hoge(n: Int): Single<Int> {
    Thread.sleep(1000L * n);
    return Single.just(n)
}
```

[Rxでzipを使って3ソースから情報取得するKotlinコード](https://swada.net/rxkotlin-zip-triple-souces/)
