## Run script on startup

If this does not run you have to create a symlink to `/etc/rc.d/`

```
$ ln -s /etc/init.d/start_my_app /etc/rc.d/
```

####

`/etc/init.d/`以下にスクリプトを配置する。
このとき，scriptファイルの先頭に`#!/bin/sh`を追加することを忘れずに。

```
chmod +x /etc/init.d/<foo>
```

[How to run a shell script at startup](https://stackoverflow.com/questions/12973777/how-to-run-a-shell-script-at-startup)
[/etc/rc.d/init.d/と/etc/init.d/の違いって・・・](https://blog.adachin.me/archives/1684)
