## Recognization exFAT formetted USB flash drives

Raspbianでは初期状態ではexFATでフォーマットされたUSBを認識できない。

exfat-fuseをインストールして解決する。

```
$ sudo apt install exfat-fuse -y
```

[Raspberry Pi に exFAT の外付けHDDを接続する](http://eagle02b.blog55.fc2.com/blog-entry-120.html)
