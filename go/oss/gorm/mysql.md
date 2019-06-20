## Grom: MySQL

```go
// Get first record, order by primary key
db.First(&user)
//// SELECT * FROM users ORDER BY id LIMIT 1;

// Get last record, order by primary key
db.Last(&user)
//// SELECT * FROM users ORDER BY id DESC LIMIT 1;

// Get all records
db.Find(&users)
//// SELECT * FROM users;

// Get record with primary key (only works for integer primary key)
db.First(&user, 10)
//// SELECT * FROM users WHERE id = 10;
```

[Go言語のGORMを使ってみた①](https://qiita.com/gorilla0513/items/27cd34433a48fc8b65db)
[CRUD: Reading and Writing Data #Query](http://jinzhu.me/gorm/crud.html#query)
