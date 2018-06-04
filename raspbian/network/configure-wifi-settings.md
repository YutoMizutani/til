## Configure wifi settings

`~/../../etc/wpa_supplicant/wpa_supplicant.conf`を編集する。

```
$ sudo vi ~/../../etc/wpa_supplicant/wpa_supplicant.conf
```

設定内容

```
network={
    ssid="<foo SSID>"
    psk="<bar password>"
    key_mgmt=WPA-PSK
}
```

ちなみに，
[サプリカント 【 supplicant 】](http://e-words.jp/w/%E3%82%B5%E3%83%97%E3%83%AA%E3%82%AB%E3%83%B3%E3%83%88.html)
> サプリカントとは、ネットワーク上のユーザ認証や端末認証において、認証を要求する側(クライアント側)の機器やソフトウェアのこと。また、クライアント側で認証のやり取りを実行するソフトウェアのこと。

[サプリカント 【 supplicant 】](http://e-words.jp/w/%E3%82%B5%E3%83%97%E3%83%AA%E3%82%AB%E3%83%B3%E3%83%88.html)
