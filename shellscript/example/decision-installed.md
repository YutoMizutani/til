## Decision already installed

```bash
if ! type $(HOMEBREW_COMMAND) > /dev/null 2>&1; then /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi
```

[シェルスクリプトでコマンドの有無を確かめる](http://please-sleep.cou929.nu/check-command-existence-on-shellscript.html)
[シェルスクリプト(bash)のif文とtestコマンド([])自分メモ](https://qiita.com/toshihirock/items/461da0f60f975f6acb10)
