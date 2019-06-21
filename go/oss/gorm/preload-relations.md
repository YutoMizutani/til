## Preload relations

```go
models := []NotificationModel {}
db.Preload('Zones').Preload('Regions').Find(&models)
```

[Select all rows and include relations #1301 - jinzhu/gorm](https://github.com/jinzhu/gorm/issues/1301)
[Preloading (Eager loading)](http://gorm.io/docs/preload.html)
