## Use array content in gorm

```go
type Game struct {
    gorm.Model
    GameImages   []GameImage
}

type GameImage struct {
    gorm.Model
    Name string
}

db.Model(&game).Related(&gameImages)
```

[Go-gorm mysql “unsupported type []string, a slice of string”](https://stackoverflow.com/questions/52244001/go-gorm-mysql-unsupported-type-string-a-slice-of-string)
[Unable to use postgress array types | jinzhu/gorm](https://github.com/jinzhu/gorm/issues/1588)
