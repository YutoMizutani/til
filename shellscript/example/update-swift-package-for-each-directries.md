## Update swift package for each directries

```
$ p=`pwd`; for f in $(find ./ -maxdepth 3 -name Package.swift); for d in $(dirname ${f}); do cd ./${d}; swift package update; swift package generate-xcodeproj; cd ${p}; done
```

[findでヒットしたディレクトリに移動してはあるコマンドを実行するにはどうすればいいでしょうか？](https://teratail.com/questions/92665)
[find -exec でパイプを介した複数コマンドの実行](https://tex2e.github.io/blog/shell/find-exec)
