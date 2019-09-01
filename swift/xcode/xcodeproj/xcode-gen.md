## Replace project using XcodeGen

```
$ brew install xcodegen
$ bash <(curl -sL https://raw.githubusercontent.com/toshi0383/scripts/master/swiftpm/install.sh) toshi0383/xcconfig-extractor
$ xcconfig-extractor <project_name>.xcodeproj configs
$ touch project.yml
$ xcodegen
```

[なるべくコンフリクトしないXcodeプロジェクトの作成手順](https://qiita.com/choimake/items/c7dcc7687b565843db74)
