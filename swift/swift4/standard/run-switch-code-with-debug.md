## Run switch code with debug

デバッグビルドか否かのフラグによりコンパイルを決めるコード。

[Swiftでifdef DEBUGのようにデバッグ時にのみ処理するコードを書く](https://trueman-developer.blogspot.com/2016/12/swiftifdef-debug.html)
> XCode8以降？ はデフォルトでデバッグフラグが設けられているようです。
> プロジェクトのBuild Settings → Preprocessor Macrosで確認できます。

```swift
#if DEBUG
    print("debug code")
#else
    print("release code")
#endif
```

[Swiftでifdef DEBUGのようにデバッグ時にのみ処理するコードを書く](https://trueman-developer.blogspot.com/2016/12/swiftifdef-debug.html)
[Swift での #ifdef DEBUG のやり方](https://qiita.com/qmihara/items/a6b88b74fe64e1e05ca4)
