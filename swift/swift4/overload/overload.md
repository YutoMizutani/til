## overload

多重定義

同じ関数名で複数の引数を取ったり，複数の型を返すことができる。

> ## Swiftでメソッドをオーバーロードする

```swift
class Deal {

    func sum (price: Int) -> Int {
        return price;
    }

    func sum (price: Int, tax: Double) -> Int {
        return Int(Double(price) * tax);
    }

    func sum (price: Int, tax: Double, postage: Int) -> Int {
        return Int(Double(price) * tax + Double(postage));
    }

}

let deal = Deal()
print(deal.sum(1000)) // 1000
print(deal.sum(1000, tax: 1.08)) // 1080
print(deal.sum(1000, tax: 1.08, postage: 300)) // 1380
```

> ## おまけ: 戻り値でもオーバーロードできる

```swift
class Deal {
    func sum (price: Int) -> Int {
        return price;
    }

    func sum (price: Int) -> String {
        return String(price) + "円";
    }
}

let deal = Deal()
let price: Int = deal.sum(100)
let priceStr: String = deal.sum(100)

print(price) // 100
print(priceStr) // "100円"
```

> 戻り値でもオーバーロードできるけど、その際は price: Int, price: String みたいにしっかりと型を指定してあげないとエラーになるよ。

[Swiftでメソッドをオーバーロードする方法](http://swift.tecc0.com/?p=277)
