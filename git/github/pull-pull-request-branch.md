## Pull pull-request branch

```
$ git fetch origin pull/(issue num)/head:(foo branch name)
```

#### Usage

```
git fetch origin pull/703/head:pullreq/703
git fetch upstream pull/726/head:pullreq/726
```

```
git fetch upstream pull/703/head:pr/703 && git checkout pr/703
```

[Githubで特定のpull requestをローカルに持ってくる](https://qiita.com/tarr1124/items/d807887418671adbc46f)
[Checking out pull requests locally](https://help.github.com/articles/checking-out-pull-requests-locally/)
