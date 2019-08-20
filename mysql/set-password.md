## Set password

#### Current user

```
mysql > set password = password('hogehoge123');
```

#### Others

```
mysql > set password for 'testuser'@'localhost' = password('hogehoge123');
```

[よく使うMySQLコマンド集](https://qiita.com/CyberMergina/items/f889519e6be19c46f5f4)
