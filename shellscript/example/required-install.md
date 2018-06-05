## 配列に入れたパッケージを自動でインストールするShellScript

ShellScriptの入門として、
配列内のパッケージをインストールするスクリプトを書いてみました。

各OSでインストールするために、一致するパッケージマネージャにてインストールを試みます。

```sh
#!/bin/bash
# Copyright (c) Yuto Mizutani

# 必要なパッケージ名; ()内を変更する。
required=(foo bar)
# パッケージマネージャ一覧
pm=(brew apt yum port pacman)

# パッケージごとにチェック
for r in ${required[@]}; do
  # パッケージが存在しなければインストールする
  if ! type ${r} >/dev/null 2>&1; then
    for p in ${pm[@]}; do
      # 一致するパッケージマネージャでインストールを試みる。
      if type ${p} >/dev/null 2>&1; then
        echo "Not installed jq, will be installed."
        yes | sudo ${p} install ${r}
        break
      fi
    done
  fi

  # 確認をし、インストールに失敗していた場合はループを抜ける。
  if ! type ${r} >/dev/null 2>&1; then
    echo "Error: Required ${r}"
    exit 1
  fi
done

echo "Completed!"
```

## 補足

dash(`$ sh foo.sh`)では`Syntax error: "(" unexpected`となったため、
エラーが発生する方は`bash foo.sh`で実行すると良いでしょう。

## 参考

[これだけ覚えておけばOK！シェルスクリプトで冪等性を担保するためのTips集](https://qiita.com/yn-misaki/items/3ec0605cba228a7d5c9a)
[意外な理由（？）で「Shell script arrays Syntax error: “(” unexpected」](https://pc.casey.jp/archives/153904527)
