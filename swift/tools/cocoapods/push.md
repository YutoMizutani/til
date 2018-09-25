## Push to CocoaPods

```sh
($ git checkout master)
$ git tag 0.1.0
$ git push origin 0.1.0 # git push origin --tags
$ pod spec lint SampleLib.podspec
$ pod trunk push SampleLib.podspec
```

[Swiftでライブラリを公開する](https://qiita.com/morizotter/items/2e45f8f94c1010ebd69f#_reference-a49d6180f7efda206a63)
[CocoaPodsでPodの利用＆作成のメモ](https://qiita.com/makoto_kw/items/edf758a67bd4c2ba5b7a)
