## Install and upgrade on Linux

#### インストール (& アップグレード)

[ダウンロードページ](https://www.vagrantup.com/downloads.html)から、最新のバージョンを確認する。
Linuxのダウンロードページはzip形式のため、該当のバージョンの末尾`1_linux_amd64.zip`を`_x86_64.deb`に変更する。

```
$ curl -L -O https://releases.hashicorp.com/vagrant/2.1.1/vagrant_2.1.1_x86_64.deb
$ sudo dpkg -i vagrant_2.1.1_x86_64.deb
# sudo apt install virtualbox
$ sudo apt remove virtualbox-dkms
$ sudo apt install virtualbox-dkms
```

#### 補足

WindowsとWSLでVagrantのバージョンが異なる場合怒られる(ちゃんと確認しているんだなぁ)。

```
~/programs/vagrant
☻  vagrant init bento/centos-7.4
Vagrant cannot currently enable access to manage machines within the Windows
environment because the version of Vagrant installed on Windows does not
match this version of Vagrant running within the Windows Subsystem for Linux.
Please ensure both installation of Vagrant are the same. If you do not want
update your Vagrant installations you can disable Windows access by unsetting
the `VAGRANT_WSL_ACCESS_WINDOWS_USER` environment variable.

  Windows Vagrant version: 2.1.1
  Windows Subsystem for Linux Vagrant version: 2.0.3
```

#### 補足2

```
☻  virtualbox
WARNING: The character device /dev/vboxdrv does not exist.
         Please install the virtualbox-dkms package and the appropriate
         headers, most likely linux-headers-Microsoft.

         You will not be able to start VMs until this problem is fixed.
Qt FATAL: QXcbConnection: Could not connect to display
[1]    7300 abort (core dumped)  virtualbox
```

[curlでファイルをダウンロードする](http://d.hatena.ne.jp/ksaito11/20090605/1244208059)
[How do I upgrade Vagrant to the latest version in Ubuntu?](https://superuser.com/questions/845987/how-do-i-upgrade-vagrant-to-the-latest-version-in-ubuntu)
