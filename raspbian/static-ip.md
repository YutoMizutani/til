## Setup static IP address

```
vi /etc/dhcpcd.conf
```

/etc/dhcpcd.confに以下を追記する。※

```
interface eth0
static ip_address=192.168.1.XX/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```

※ Raspbian Jessie以降は/etc/dhcpcd.confだが，Raspbian Wheezy以前では/etc/network/interfacesを編集する。


以下，説明
  ```
  # Static IP Address
  interface eth0
  # IPアドレスとサブネットマスク（任意 *①のIP/24でOK）
  static ip_address=192.168.1.xxx/24

  # デフォルトゲートウェイ（ルータのIPアドレス *ブリッジしてる場合はそっちのIP）
  static routers=192.168.1.xxx

  # DNSサーバ（ルータのIPアドレス *ブリッジしてる場合はそっちのIP）
  static domain_name_servers=192.168.1.xxx
  ```

[【Raspberry Pi 3】IPアドレス固定](https://qiita.com/BearcubThaw/items/cde2494556d609115fb6)
[How do I set up networking/WiFi/static IP address?](https://raspberrypi.stackexchange.com/questions/37920/how-do-i-set-up-networking-wifi-static-ip-address)
