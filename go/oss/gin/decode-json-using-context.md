## Decode JSON using context

```go
v1.POST("/login", func(c *gin.Context) {
    var loginCmd LoginCommand
    c.BindJSON(&loginCmd)
    c.JSON(http.StatusOK, gin.H{"user": loginCmd.Username})
})
```

[POST request and json body](https://github.com/gin-gonic/gin/issues/424)
