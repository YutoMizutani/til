## MacBuntu

## About

You will change from your Ubuntu to (faked) Mac, you can do below features,

* Change wallpaper
* Install icons and cursors like macOS Y Theme
* Install macOS fonts
* Install *Albert* like macOS Spotlight
* Install *Plank Dock* like macOS Dock
* Install *slingscold* like macOS Launchpad
* Install *Linuxbrew* using `brew` command like macOS Homebrew

## Change wallpaper

You could get mac wallpapers belows,

[MacBuntu-Wallpapers.zip](http://drive.noobslab.com/data/Mac/MacBuntu-Wallpapers.zip)

If you will want to High Sierra theme, download belows,

[macOS 10.13 High Sierra Wallpaper - Imgur.jpg](https://imgur.com/icu9yIJ)

## Install icons and cursors like macOS Y Theme

```
$ sudo add-apt-repository ppa:noobslab/macbuntu
$ sudo apt-get update
$ sudo apt-get install macbuntu-os-icons-v10
$ sudo apt-get install macbuntu-os-ithemes-v10
```

When remove,

```
$ sudo apt-get remove macbuntu-os-icons-v9 macbuntu-os-ithemes-v9
```

## Install macOS fonts

```
$ wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip
$ sudo unzip mac-fonts.zip -d /usr/share/fonts; rm mac-fonts.zip
$ sudo fc-cache -f -v
```

## Install *Albert* Mac-like Spotlight

```
$ sudo add-apt-repository ppa:noobslab/macbuntu
$ sudo apt-get update
$ sudo apt-get install albert
```

## Install *Plank Dock* like macOS Dock

```
$ sudo apt-get install plank
$ sudo add-apt-repository ppa:noobslab/macbuntu
$ sudo apt-get update
$ sudo apt-get install macbuntu-os-plank-theme-v9
```

When remove,

```
$ sudo apt-get autoremove plank macbuntu-os-plank-theme-v9
```

## Install *slingscold* like macOS Launchpad

```
$ sudo add-apt-repository ppa:noobslab/macbuntu
$ sudo apt-get update
$ sudo apt-get install slingscold
```

## Install *Linuxbrew* using `brew` command like macOS Homebrew

```
$ sudo apt-get install build-essential curl file git
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
$ test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
$ test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
$ test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
$ echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
```

## References

[MacBuntu 17.10 Transformation Pack Ready For Ubuntu 17.10 Artful Aardvark](https://www.noobslab.com/2018/01/macbuntu-1710-transformation-pack-ready.html)

[Linuxbrew/brew](https://github.com/Linuxbrew/brew)

[MacbuntuでUbuntuをMac風に！　17.10と16.04それぞれにやってみた](https://yagichon.com/ubuntu1710-macbuntu/)

[【Ubuntu】2009年製のASUSノートPCをMacBook Airもどきにする](https://yagichon.com/asus-ul20a-transform-macbuntu/)
