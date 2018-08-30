## jazzy

## Install jazzy

```
$ sudo gem install jazzy
```

## Pre-Generate

```
$ cd <foo project>
$ mkdir <bar document>
```

## Config file

```yaml
jazzy \
  --clean \
  --author YutoMizutani \
  --github_url hhttps://github.com/YutoMizutani/OperantKit \
  --github-file-prefix https://github.com/realm/realm-cocoa/tree/v0.0.1 \
  --module-version 0.0.1 \
  --xcodebuild-arguments -scheme,OperantKit \
  --module OperantKit \
  --output docs/swift_output \
  --theme docs/themes
```

## Usages

```
$ jazzy -o <bar document>
```

## Gerenate when *Run Script*

![](https://camo.qiitausercontent.com/2253611b1d5eeacd1ad7aed216b072e4fdb9b2ff/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f32353235302f63303631666538642d643763652d353139302d656132662d3239353462363132386166342e706e67)

## References

- [Xcode7.3 & SwiftでつくるCocoaTouch Framework（jazzy - ドキュメント生成編）](https://qiita.com/mfks17/items/13992dbe8530c069d3a7)
- [jazzyを使って、Swiftで書いたプロジェクトのリファレンスを自動生成しよう！](http://grandbig.github.io/blog/2016/01/12/jazzy/)
