## File mode settings (on windows)

Git Bashでgit diffした場合に
old mode 100755
new mode 100644
となる問題の解決

```
$ git config core.filemode false
```

[Gitで変更していないはずのファイルが変更とみなされる](https://qiita.com/hishida/items/35d929845c0ac824b1c0)
