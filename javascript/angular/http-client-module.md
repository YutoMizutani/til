## HttpClient

#### Requre

Angular 4.3以上

## GET

#### 基本アクセス

`get`で送られてきたresponseの型は`object`(subscribeで受け取った場合)。

```ts
this.http.get(url)
    .subscribe(response => {
        console.log(response['foo'])
    })
```

#### With interface

`interface`でjsonを定義することによって、objectから直接アクセスすることができる。

```ts
interface FooResponse {
    foo: string
}

this.http.get<FooResponse>(url)
    // subscribeの時点でFooResponseとして受け取れる
    .subscribe(response => {
        console.log(response.foo)     // OK
        console.log(response['foo'])  // OK
    })
```

#### Full response

完全なレスポンスの取得

```ts
interface FooResponse {
    foo: string
}

// getメソッドにobserveオプションを指定
this.http.get<FooResponse>(url, { observe: 'response' })
    .subscribe(response => {
        // ヘッダ情報はresponse.headersに格納。getメソッドで取得。
        console.log(response.headers.get('X-My-Header'))

        // レスポンスボディはresponse.bodyに格納。型指定も有効。
        console.log(response.body.foo)
    })
```

#### Usage

`app/app.module.ts`

```ts
import { NgModule }         from '@angular/core'
import { BrowserModule }    from '@angular/platform-browser'
import { HttpClientModule } from '@angular/common/http'

@NgModule({
  imports: [
    BrowserModule,
    HttpClientModule,
  ],
  declarations: [
    AppComponent,
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule {}
```

`app/app.component.ts`

```ts
import { Component } from '@angular/core'
import { HttpClient } from '@angular/common/http'

import { map } from 'rxjs/operators'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(
    private http: HttpClient
  ) {}

  // origin
  let origin = () => {
    this.http.get('http://httpbin.org/ip').subscribe(data => {
      const origin = "origin: " + data['origin']
      console.log(origin)
    })
  }

  // user-agent
  let userAgent = () => {
    this.http.get('http://httpbin.org/user-agent').subscribe(data => {
      const userAgent = "user-agent: " + data['user-agent']
      console.log(userAgent)
    })
  }

  // get
  let get = () => {
    this.http.get('http://httpbin.org/get', { responseType: 'text' }).subscribe(text => {
      const get = text
      console.log(get)
    })
  }
}
```

## References

[HttpClient](https://angular.io/guide/http)
[Angular 4.3で追加されたHttpClientModuleについてのメモ](https://qiita.com/ponday/items/1ec0e500cd801286845e)
[httpbin(1): HTTP Request & Response Service](https://nghttp2.org/httpbin/)
