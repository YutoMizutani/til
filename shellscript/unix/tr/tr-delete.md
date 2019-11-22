## tr -d

```sh
echo "Hello!!" | tr -d "!" # Hello
```

:warning: 文字列の指定はできない (cf. `sed` )

```sh
echo "Hello, world" | tr -d ", world" # He
```

```sh
echo "Hello, world" | sed -e "s/, world//" # Hello
```

[trコマンドの使い方: UNIX/Linuxの部屋 - X68000.qed.net](http://x68000.q-e-d.net/~68user/unix/pickup?tr)
