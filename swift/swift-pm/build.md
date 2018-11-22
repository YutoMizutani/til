## Build using Swift Package Manager

Swift Package Managerでビルド & 実行。

#### ビルド

```
$ cd <foo>
$ swift build
```

#### 実行

```
$ .build/debug/<foo>
```

#### ビルド(リリースビルド)

```
$ swift build -c release
```

#### ワンライナー

```
$ swift build && swift package generate-xcodeproj && open ${PWD##*/}.xcodeproj
```

[Swift Package Manager (SwiftPM) で作るコマンドラインツール](https://qiita.com/mono0926/items/e8fdd97115780204f797)
