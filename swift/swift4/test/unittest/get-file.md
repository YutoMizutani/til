## Get file in bundle

[iOSプロジェクトのテストバンドルに存在するファイルを取得する](https://qiita.com/enomotok_/items/27d132969b41bcd26187)
> ユニットテスト等でテストバンドルに存在しているファイルを取得するにはこの方法ではうまくいかない。

```swift
let bundle = Bundle(for: type(of: self))
let path: URL? = bundle.url(forResource: "foo", withExtension: "json")
let data: Data? = try? Data(contentsOf: path!, options: .uncached)
```

#### In standard app Case

Different with App and Test.

```swift
let path = Bundle.main.path(forResource: "bar", ofType: "json")
let data: Data? = try? Data(contentsOfFile: path!, options: .uncached)
```

#### References

[iOSプロジェクトのテストバンドルに存在するファイルを取得する](https://qiita.com/enomotok_/items/27d132969b41bcd26187)
[Why can't code inside unit tests find bundle resources?](https://stackoverflow.com/questions/1879247/why-cant-code-inside-unit-tests-find-bundle-resources/39611528)
