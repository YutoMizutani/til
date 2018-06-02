## Change port number

`ssh: connect to host bahhudson.mine.nu port 22: Connection refused`というエラーが発生したため，ポート番号を変更する。

#### ポート番号を変更する

`/etc/ssh/sshd_config`を編集する。

```
pi:~ $ sudo vi /etc/ssh/sshd_config
```

Port番号を変更する。

```
# What ports, IPs and protocols we listen for
# Port 22
Port <foo;different 22, e.g. 2222>
```

sshの再起動
(ちなみに，起動は`sudo service ssh start`)

```
pi:~ $ sudo service ssh restart
```

接続の際は`-p`にポート番号を渡す。

```
$ sudo ssh <pi name>@<ip address> -p <foo>
```

[ssh: connect to host myremotehost.com port 22: Connection refused](https://askubuntu.com/questions/144364/ssh-connect-to-host-myremotehost-com-port-22-connection-refused)
