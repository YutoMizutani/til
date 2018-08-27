## Travis CI


## Use swift

```yaml
language: objective-c
osx_image: xcode9.4
xcode_project: <foo>.xcodeproj
xcode_sdk: iphonesimulator11.4
```

## Slack notification

```yaml
notifications:
  slack: <foo>:<bar>
  email: false
```

## magic

```yaml
after_success:
  - sleep 5 # https://github.com/travis-ci/travis-ci/issues/4725
```

## References

[Travis CI](https://github.com/marketplace/travis-ci)
[GitHubと連携できる継続的インテグレーションツール「Travis CI」入門](https://knowledge.sakura.ad.jp/3754/)
[ド素人のための Travis CI の使い方 (公式ガイドより)](https://qiita.com/YumaInaura/items/8021d38cb202950fb18c)
[CI(継続的インテグレーション)ツールで効率的で持続可能なGitHub運用を！](https://qiita.com/Sekky0905/items/3a48d41ea60ef134c579)
[Building an Objective-C or Swift Project - Travis CI](https://docs.travis-ci.com/user/languages/objective-c/)
[Travis CI を使って GitHub 上の Swift プロジェクトをテストする](https://ez-net.jp/article/96/6hS5SChD/S4sD0jPmTLoJ/)
