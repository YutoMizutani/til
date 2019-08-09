## Sed overwrite in macOS (BSD sed)

```sh
$ sed -i '.bak' 's/aaa/zzz/' hoge.txt # 拡張子'.bak'でバックアップ
$ sed -i '' 's/aaa/zzz/' fuga.txt # バックアップファイルは生成されない
```

> 「saving backups with the specified extension.」とあります。つまり、BSD sedでの上書き保存には、バックアップ用拡張子の指定が必須なのです。

[Macの（BSD版）sed での上書き保存](https://qiita.com/catfist/items/1156ae0c7875f61417ee)
