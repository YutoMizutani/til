## godotenv

[godotenvを使ったGolangでの環境変数の設定方法](https://tomokazu-kozuma.com/how-to-set-environment-variables-in-golang-using-godotenv/)
> Golangでの環境変数の設定方法

```
$ go get github.com/joho/godotenv
```

```go
package main

import (
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load(fmt.Sprintf("envfiles/%s.env", os.Getenv("GO_ENV")))
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	user := os.Getenv("DB_USER")
	pass := os.Getenv("DB_PASS")

	log.Println(user) // test
	log.Println(pass) // 12345678
```

[github.com/joho/godotenv](github.com/joho/godotenv)
[godotenvを使ったGolangでの環境変数の設定方法](https://tomokazu-kozuma.com/how-to-set-environment-variables-in-golang-using-godotenv/)
