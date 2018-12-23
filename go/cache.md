## Cache using go-cache in Golang

[Go言語でデータをキャッシュしたい時に便利な『go-cache』の使い方](https://louliz.com/how-to-use-go-cache)
```go
package main

import (
	"fmt"
	"time"

	cache "github.com/patrickmn/go-cache"
)

func main() {
	c := cache.New(1*time.Hour, 2*time.Hour)

	c.Set("gm", "おはようございます。", cache.DefaultExpiration)

	data, found := c.Get("gm")
	if found {
		fmt.Println("gm: ", data.(string))
	}

	data, found = c.Get("abc")
	if found {
		fmt.Println("abc: ", data.(string))
	}
}
```

[Goのインメモリキャッシュ用ライブラリ「go-cache」のご紹介](http://tech-savvy.hatenablog.com/entry/go-cache)
```go
// キャッシュを利用する場合にそれを格納するためのインスタンスを作る
type Instance struct {
    cache *cache.Cache
    client *github.Client
}

// インスタンス作成用のメソッド
func New() *Instance {
    httpClient := newAuthenticatedClient()
    client := github.NewClient(httpClient)

    I := &Instance{
      // 特定のキャッシュを5分間だけ残しておく
      // 30秒ごとに失効済みキャッシュを廃棄する
        cache: cache.New(5*time.Minute, 30*time.Second),
        client: client,
    }

    return I
}

// 自分のユースケースだとGithubのNotification情報を取ってくるので、こんな感じ
func (i Instance) GetNotifications() []github.Notification {

  // cv(cached valueの略のつもり...)
  // キャッシュがあれば取ってきてそれを返す。
  // go-cacheでは第2の戻り値に、キャッシュの存在有無のフラグ(以下ではfound)が入ってくる。
    if cv, found := i.cache.Get("notifications"); found {
        cachedNotifications := cv.([]github.Notification)
        return cachedNotifications
    }

    // APIからのresponse
    opt := &github.NotificationListOptions{All: true}
    notifications, _, err := i.client.Activity.ListNotifications(opt)
    if err != nil {
        log.Fatal(err)
    }

    // キャッシュがなかった場合は次回のためにSetする
    i.cache.Set("notifications", notifications, cache.DefaultExpiration)
    return notifications
}
```

[Go言語でデータをキャッシュしたい時に便利な『go-cache』の使い方](https://louliz.com/how-to-use-go-cache)
[Goのインメモリキャッシュ用ライブラリ「go-cache」のご紹介](http://tech-savvy.hatenablog.com/entry/go-cache)
