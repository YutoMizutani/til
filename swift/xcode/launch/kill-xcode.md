## Kill Xcode form terminal

```sh
pkill -f Xcode
```

```sh
#!/bin/bash
echo "Killing xcode..."
kill $(ps aux | grep 'Xcode' | awk '{print $2}')
```

[How to kill Xcode from the command line](https://agilewarrior.wordpress.com/2012/06/28/how-to-kill-xcode-from-the-command-line/)
[How to kill all processes matching a name?](https://stackoverflow.com/questions/6381229/how-to-kill-all-processes-matching-a-name)
