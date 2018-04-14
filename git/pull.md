## Pull

プルリク等を受けて履歴を受けられない場合にrebaseオプションを使用。

```
$ git pull --rebase origin master
```

[http://akiyoko.hatenablog.jp/entry/2013/06/05/230557](http://akiyoko.hatenablog.jp/entry/2013/06/05/230557)
> ちなみに、git pullは、実際には「git fetch して git merge」してるだけとどこかで読んだことがあります。--rebaseオプションを付けることで、fetch してからリモートリポジトリでリベースしてくれるというイメージなのかな。
いずれにせよ、便利♪