## Fetch deleted upstream branch

Github上で(または他人が)Branchを削除した場合，localもその情報を更新しなければならない。
特に，branchを削除後，同じbranchを再生成した場合などにpush時エラーが発生する。

```
$ git remote prune upstream
$ git remote prune origin
```
