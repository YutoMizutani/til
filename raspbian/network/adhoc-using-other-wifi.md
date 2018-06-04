# Raspberry Pi 3にUSB無線LANアダプタを接続し，インターネット接続を維持しつつアドホック通信を行う

Keywords: RaspberryPi, Raspberrypi3, wlan, AdHoc, SSH

## 本記事の要約

Wi-Fiを2つ用意し，wlan設定の一方をインターネット接続に，もう一方をAd-Hoc接続に指定することで，Raspberry Pi側のインターネット接続を維持したままAd-Hoc通信を行うことができた。また，その設定においては，追加のソフトウェアインストールは不要であった。

## はじめに

同じWi-Fiを使用していないRaspberry Pi 3を使用し，Ad-Hoc通信を行いたい。
一方で，普通に設定するだけでは，内蔵Wi-FiがAd-Hoc用に使用されてしまい，インターネット接続が出来なくなってしまう。どうにか両立させることはできないか。

そこで，内蔵Wi-Fiによるインターネット接続を維持したまま，USB無線LANアダプタを使用して別のWi-FiからAd-Hoc経由でssh接続ができるように設定する。

イメージは以下の通り。

![adhoc.png](https://qiita-image-store.s3.amazonaws.com/0/195913/1d9f70d1-4a76-0ea5-ee0e-e5301ec53f2d.png)
$$\style{align: center; font-family: "Helvetica Neue",Helvetica,"ヒラギノ角ゴ ProN W3","Hiragino Kaku Gothic ProN","メイリオ",Meiryo,sans-serif}{\text{Fig 1. Raspberry PiとmacOS間の通信概念図}}$$


最後まで同一Wi-Fiのssh接続で設定可能(見分けがつくよう，Raspberry Piでの設定は`pi:~ $`，macOSでの設定は`$`にて記載している)。

(macOS側のLANもAd-Hoc用に使用されるため，インターネット接続は利用できなくなってしまう。必要があれば有線接続やUSBテザリングで代用するか，macOS側にもUSB無線LANアダプタを接続することで対処する。)

※ なお，macOSにはInternet Sharing機能があるため，よっぽどの理由がない限りはそれを利用した方が他の機器への設定を考えると楽である。その場合は [How to SSH into your Raspberry Pi with a Mac and Ethernet Cable](https://medium.com/@tzhenghao/how-to-ssh-into-your-raspberry-pi-with-a-mac-and-ethernet-cable-636a197d055) などを参考にすると良い。

## 環境

Raspberry Pi 3 Model B Raspbian

```
pi@~ $ cat /proc/cpuinfo
Hardware	: BCM2835
Revision	: a22082

pi@~ $ cat /etc/os-release
PRETTY_NAME="Raspbian GNU/Linux 8 (jessie)"
```

macOS High Sierra

```
$ system_profiler SPSoftwareDataType
System Version: macOS 10.13.4 (17E202)

$ sysctl hw.model
hw.model: MacBookPro12,1
```

## USB無線LANアダプタの設定

初期設定は終えたものとする。

USB無線LANアダプタを使用すると，wlanが追加される(内蔵Wi-Fiがwlan0に指定されているため，wlan1を設定する)。
wlan0に設定を行うと，USB無線LANアダプタを外した場合に内蔵Wi-Fiによるインターネット接続が出来なくなるため，wlan1にAd-Hoc用の設定を行っている。

`/etc/network/interfaces`を編集する。

```
pi:~ $ sudo sudo vi /etc/network/interfaces
```

wireless-keyは必須項目ではないが，設定する場合は [WIRELESS (WIFI) WEP WPA WPA2 KEY GENERATOR](http://www.firewall.cx/cisco-technical-knowledgebase/cisco-wireless/828-cisco-wireless-wlan-keygen.html) などを利用してキーを生成すると良い。

以下を追加する。

```
iface wlan1 inet manual
auto wlan1
iface wlan1 inet static
    address 192.168.<foo>.<bar>
    netmask 255.255.255.0
    wireless-channel 1
    wireless-mode ad-hoc
    wireless-essid <display name>
    # wireless-key <104 bit WSP>
```

## wlan1の設定を適用する。

```
pi:~ $ sudo ifdown wlan1
pi:~ $ sudo ifup wlan1
pi:~ $ sudo reboot
```

ここで，設定に異常がある場合には，`sudo ifup wlan1`の時点でエラーとなる。

## Ad-Hoc接続

設定が反映されるとmac側のWi-Fiから，Deviceに表示される。選択後，`wireless-key`で設定したパスワードを記入し，接続を行う。
<img width="407" alt="mac-wifi.png" src="https://qiita-image-store.s3.amazonaws.com/0/195913/f239018e-7c90-9899-7096-1fec11423404.png">
$$\style{align: center; font-family: "Helvetica Neue",Helvetica,"ヒラギノ角ゴ ProN W3","Hiragino Kaku Gothic ProN","メイリオ",Meiryo,sans-serif}{\text{Fig 2. Wi-Fi ステータス画面}}$$

接続後，Raspberry Piに対してAd-Hoc接続を行う機器のIP address設定を行う。

macOSの場合，`System Preferences.../Network/Advanced.../TCP/IP`から，
Configure IPv4を`Using DHCP`に，IPv4 AddressをRaspberry Piで設定したAd-Hoc側のwlan IP addressと **重複しない** IP addressを指定する。

<img width="780" alt="mac-network.png" src="https://qiita-image-store.s3.amazonaws.com/0/195913/d25b3984-78f2-f60f-0ce2-58a9eb62baf4.png">
$$\style{align: center; font-family: "Helvetica Neue",Helvetica,"ヒラギノ角ゴ ProN W3","Hiragino Kaku Gothic ProN","メイリオ",Meiryo,sans-serif}{\text{Fig 3. macOS TCP/IP 設定画面}}$$

最後に，ssh接続が出来れば成功。

```
$ sudo ssh <pi name>@<wlan1 IP address>
```

お疲れ様でした。

## (付録) mac側のWi-Fi設定を戻す場合

元のWi-Fi接続には，Raspberry Pi用に設定したIP address設定を元に戻す必要がある。

<img width="780" alt="mac-network-default.png" src="https://qiita-image-store.s3.amazonaws.com/0/195913/ccbd0078-ad54-de3f-3d62-32ff9d72c4cc.png">
$$\style{align: center; font-family: "Helvetica Neue",Helvetica,"ヒラギノ角ゴ ProN W3","Hiragino Kaku Gothic ProN","メイリオ",Meiryo,sans-serif}{\text{Fig 4. macOS TCP/IP 初期設定}}$$

## References

[こんにちは。raspberry pi の無線LANについて教えてください。](https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q10161466180)
[Connecting to RPi 3 ad-hoc network from windows PC](https://raspberrypi.stackexchange.com/questions/70621/connecting-to-rpi-3-ad-hoc-network-from-windows-pc)
[Ad Hoc setup in RPi 3](https://raspberrypi.stackexchange.com/questions/49660/ad-hoc-setup-in-rpi-3)
[Raspberry Pi を BUFFALO の USB wifi で ad-hoc 通信する設定](https://qiita.com/UedaTakeyuki/items/851fc8c19f36b96a0ae6)
[WIRELESS (WIFI) WEP WPA WPA2 KEY GENERATOR](http://www.firewall.cx/cisco-technical-knowledgebase/cisco-wireless/828-cisco-wireless-wlan-keygen.html)
[ラズパイをアドホック接続で使用する](http://www.tohuandkonsome.site/entry/2017/05/05/202821)
[How to SSH into your Raspberry Pi with a Mac and Ethernet Cable](https://medium.com/@tzhenghao/how-to-ssh-into-your-raspberry-pi-with-a-mac-and-ethernet-cable-636a197d055)
