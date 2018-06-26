## Check strage

```sh
$ df
```

## 容量をくってるベスト１００を表示
```sh
du -ma | sort -rn | head -100
```

## 5GB以上のファイル
```sh
sudo du -g -x -d 5 / | awk '$1 >= 5{print}'
```
