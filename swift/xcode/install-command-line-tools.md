## Install xcodebuild

xcrun: error: unable to find utility "xcodebuild", not a developer tool or in PATH
というエラーが発生する。

`https://developer.apple.com/download/more/` からインストール後，

```
$ sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

確認は以下。

```
$ sudo xcodebuild -license
```

[✗ Xcode: xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance #7905](https://github.com/meteor/meteor/issues/7905)
