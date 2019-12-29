## Sort Xcode project

```sh
$ curl -sS https://raw.githubusercontent.com/WebKit/webkit/master/Tools/Scripts/sort-Xcode-project-file \
    > ./script.pl \
    && perl ./script.pl `find . -maxdepth 1 -mindepth 1 -iname "*.xcodeproj"` \
    && rm -f ./script.pl
```

[Xcode project をソートする](https://qiita.com/YutoMizutani/items/6eea2ffac577ff481039#xcode-project-をソートする)
