## Check diff

```sh
#!/bin/sh

git add -N .
set +e
git diff --exit-code --quiet
EXIT_STATUS=$?
git reset --quiet
exit $EXIT_STATUS
```

以下の記事にある `git add -N (–intent-to-add)` では GUI git (Fork.app) に diff が表示されなくなってしまった。

[Git での新規ファイル作成を含んだファイル変更有無の判定方法](https://reboooot.net/post/how-to-check-changes-with-git/)
