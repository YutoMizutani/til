## Update

#### パッケージとOSの更新

```
$ sudo apt update       # パッケージリストの更新
$ sudo apt upgrade      # パッケージの更新
$ sudo apt dist-upgrade # OSのアップグレード
```

```
$ sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
```

#### ファームウェアの更新

```
$ sudo apt install rpi-update # インストール
$ sudo rpi-update                 # 更新実行
$ sudo reboot                     # 反映のための再起動
```

```
$ sudo rpi-update && sudo reboot
```

[Raspberry Pi 初期設定](https://qiita.com/HeRo/items/c1c30d7267faeb304538)
