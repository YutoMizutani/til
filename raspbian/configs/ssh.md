## ssh settings

```sh
$ mkdir .ssh
$ cat (rsa.pub) >> .ssh/authorized_keys
$ chmod 700 .ssh
$ chmod 600 .ssh/authorized_keys
$ rm (rsa.pub)
$ sudo vi /etc/ssh/sshd_config
> Port (00000)
> PermitRootLogin no
> RSAAuthentication    yes
> PubkeyAuthentication yes
> AuthorizedKeysFile   %h/.ssh/authorized_keys
> PasswordAuthentication no
$ sudo /etc/init.d/ssh restart
```
