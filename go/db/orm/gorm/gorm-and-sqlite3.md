## Gorm and SQLite3

## Open

```go
```

## Create

### Create Record

```go
user := User{Name: "Jinzhu", Age: 18, Birthday: time.Now()}
db.NewRecord(user) // => returns `true` as primary key is blank
db.Create(&user)
db.NewRecord(user) // => return `false` after `user` created
```

[CRUD: Reading and Writing Data](http://doc.gorm.io/crud.html)
[gormとgo-sqlite3の併用の仕方を教えてください！](https://teratail.com/questions/91948)
[Go言語のGORMを使ってみた①](https://qiita.com/gorilla0513/items/27cd34433a48fc8b65db)
