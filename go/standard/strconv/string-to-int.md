## string to int

```go
import "strconv"

s := "1"
n, err := strconv.Atoi(s)
if err != nil {
	return false, err
}
// n = 1
```
