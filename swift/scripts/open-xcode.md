## Open project using Xcode

```sh
$ open `find . -maxdepth 1 -mindepth 1 -iname "*.xcworkspace"`
```

```sh
PROJECT_PATH=`find . -maxdepth 1 -mindepth 1 -iname "*.xcworkspace"`
XCODE=`xcode-select --print-path | awk 'match($0, /^.*.app/){ print substr($0, RSTART, RLENGTH) }'`
open -a $XCODE $PROJECT_PATH
```

[ディレクトリ配下の Xcode workspace を検索して起動する](https://qiita.com/YutoMizutani/items/6eea2ffac577ff481039#ディレクトリ配下の-xcode-workspace-を検索して起動する)
