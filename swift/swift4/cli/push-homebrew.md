## Push to homebrew

```
$ brew create https://github.com/YutoMizutani/JSONtoCodable/releases/download/2.1.0/Source-code-jc.zip
```

foo.rb
```ruby
class Xc < Formula
  desc "Just open a Xcode project :-)"
  homepage "https://github.com/tattn/xc"
  url "https://github.com/tattn/xc/archive/0.0.1.tar.gz"
  sha256 "053e959fe4d8994c96f629d01d7153ad81699f8d0a67cc984032e081719df673"

  def install
    bin.install "xc"
  end
end
```

#### Create new GitHub repository

`homebrew-ツール名`

#### Install

```
$ brew tap　{ユーザー名}/{homebrew-を除いたリポジトリ名}
$ brew install {homebrew-を除いたリポジトリ名}
```

[Swift Package Manager(SwiftPM)で作ったコマンドラインツールをHomebrewに登録する方法](https://qiita.com/mono0926/items/c32c008384df40bf4e41)
[Cannot install by `brew install license-plist` on Xcode 9 / High Sierra (currently beta) #71](https://github.com/mono0926/LicensePlist/issues/71)
[Swift製のコマンドラインツールをbrewでインストールできるようにする](https://qiita.com/tattn/items/0f714344f8c911f5be4c)
[Xcode でコマンドラインアプリを作って Homebrew でインストールできる様にする](https://qiita.com/taketin/items/2176a76b7268b222eda5)
[HomeBrewで自作ツールを配布する](https://deeeet.com/writing/2014/05/20/brew-tap/)
