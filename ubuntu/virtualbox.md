## Install VirtualBox

・VirtualBoxのインストール
(Ubuntu作業)
参照：http://nkenbou.hatenablog.com/entry/2014/12/03/192835
https://www.virtualbox.org/wiki/Linux_Downloads
現環境は16.04LTSのAMD64のため，Ubuntu 16.04 ("Xenial")  i386 |  AMD64
のAMD64をダウンロード。

・/etc/apt/sources.list
アクセス権が制限されているディレクトリのため，
$ sudo nautilus
から開いた /etc/apt/sources.list を gedit等で開き，
deb http://download.virtualbox.org/virtualbox/debian trusty contrib
を追記。

・ Oracle public key を追加
https://www.virtualbox.org/download/oracle_vbox.asc から Oracle public key をダウンロード
$ sudo apt-key add ./Downloads/oracle_vbox.asc

sudo apt-get update
sudo apt-get install virtualbox-5.1

・Extension Packをインストール
https://www.virtualbox.org/wiki/Downloads　から
VirtualBox 5.1.28 Oracle VM VirtualBox Extension Pack  All supported platforms
をタウンロード，インストール。
