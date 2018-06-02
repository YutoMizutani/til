## tightvncserver

#### Install


```
$ sudo apt install tightvncserver
```

and usages,

```
$ tightvncserver
```

#### Setup with run startup

```
$ sudo vi /etc/init.d/vncstartup
```

```
#!/bin/sh
# /etc/init.d/tightvncserver
# Customised by Stewart Watkiss
#http://www.penguintutor.com/linux/tightvnc
# Set the VNCUSER variable to the name of the user to start tightvncserver under
VNCUSER='<foo user>'
eval cd ~$VNCUSER
case "$1" in
 start)
   su $VNCUSER -c '/usr/bin/tightvncserver :1'
   echo "Starting TightVNC server for $VNCUSER "
   ;;
 stop)
   pkill Xtightvnc
   echo "Tightvncserver stopped"
   ;;
 *)
   echo "Usage: /etc/init.d/tightvncserver {start|stop}"
   exit 1
   ;;
esac
exit 0
```

```
$ cd /etc/init.d
$ sudo chown root.root vncstartup
$ sudo chmod 755 vncstartup
$ sudo update-rc.d vncstartup defaults
```

#### Xの設定

```
$ sudo chmod 755 xstartup
$ sudo chown <foo user> xstartup
$ sudo vi /home/<foo user>/.vnc/xstartup
```

```
#!/bin/sh
xrdb $HOME/.Xresources
xsetroot -solid black
/usr/bin/lxsession -s LXDE &
```

```
$ sudo /etc/init.d/vncstartup stop
$ sudo /etc/init.d/vncstartup start
```


[Setting up a VNC server on Raspberry Pi using tightvncserver](https://steven-england.info/2014/11/23/setting-vnc-server-raspberry-pi-using-tightvncserver/)
[RASPBERRY PI で TIGHTVNC サーバ](https://raspberrypi.akaneiro.jp/archives/455)
