## Ad-Hoc mode

1. ワイヤレスネットワークに手動で接続します。

2. cmdで以下のコマンド

```
> netsh wlan set profileparameter name="<foo>" connectiontype=IBSS
> netsh wlan connect name="<foo>"
```

[Windows10で無線LANをアドホックモードで使う](https://qiita.com/h-sh/items/a9cdaaff92c3831f9fe2)
