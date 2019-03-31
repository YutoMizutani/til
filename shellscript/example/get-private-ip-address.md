## Get private IP address

/sbin/ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'

### macOS

```sh
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2
Or for linux system
```

### Ubuntu

```sh
hostname -i | awk '{print $3}'
```

### Debian

```sh
hostname -i
```

[Which terminal command to get just IP address and nothing else?](https://stackoverflow.com/questions/8529181/which-terminal-command-to-get-just-ip-address-and-nothing-else)
