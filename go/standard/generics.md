## Generics in golang

:warning: Not implemented yet

Waiting release Go 2

```go
type List(type T) []T

func (l *List(T)) PushBack(x T)

type IntList = List(int) // typealias

func Keys(type K, V)(m map[K]V) []K
```

[Go 2のgenerics/contract簡易まとめ](https://qiita.com/lufia/items/242d25e8c93d88e22a2e)
