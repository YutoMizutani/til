## Constructor in golang

```golang
import "fmt"

type Language struct {
     Name     string
     LangType string
}

// コンストラクタ
// 戻り値として返すのは、構造体のポイントであることに注意
func NewLanguage(name string, langType string) *Language {
     // コンストラクタの関数内で、構造体をnew
     l := new(Language)
     // 以下、構造体の各フィールドを引数で受け取った値に設定
     l.Name = name
     l.LangType = langType
     // 構造体のインスタンスを返す
     return l
}
```

[Goでコンストラクタ](https://qiita.com/Sekky0905/items/10c8ae9cee719d66fa84)
