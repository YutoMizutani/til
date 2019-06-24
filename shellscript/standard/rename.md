## Rename

If you will do rename and enter `$ rename $1 $2`, but return`zsh: command not found: rename`!

So add rename command manually,

```.zshrc
funciton rename(){ mv $1 $2 }
```

And add `rename` command to your .zshrc,  

```
$ echo "funciton rename(){ mv $1 $2 }" >> ~/.zshrc
```

The `mv` command is include a rename function :)


[source](https://askubuntu.com/questions/280768/how-to-rename-a-file-in-terminal)