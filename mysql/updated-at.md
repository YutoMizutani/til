## updated_at

```sql
create table users (
  id int,
  name text,
  created_at datetime  default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);
```

[MySQLでレコードを生成した時刻を、カラムの値(created_at)に入れる](https://qiita.com/kapibara-3/items/0a1679d0cbc1b250debc)
