## gitのアカウントを切り変える

> 頻度が低めな開発などのアカウントは、リポジトリ単位でアカウント情報を設定する。(./.git/config)
> ※リポジトリ内の./.git/configに設定する。

```
cd Project/develop
$ git config --local user.name "サブアカウント"
$ git config --local user.email "サブアカウントメールアドレス"
```

[複数のgitアカウントを使い分ける](https://qiita.com/0084ken/items/f4a8b0fbff135a987fea)
