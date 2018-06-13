## HttpClient POST

#### Requre

Angular 4.3以上

#### 基本アクセス

```ts
let post = (self, name) => {
  const form = {
    comments: "Hello, world!!",
    custemail: "",
    custname: "foo",
    custtel: "",
  }
  this.http.post('http://httpbin.org/post', form, { responseType: 'text' }).subscribe(text => {
    const result = text
    self.sendLog(result)
  })
}
```

このとき、url指定に誤りがある等でPOSTに失敗した場合、何も返らない。

```ts
let wrongPost = (self, name) => {
  const form = {
    comments: "Hello, world!!",
    custemail: "",
    custname: "foo",
    custtel: "",
  }
  this.http.post('', form, { responseType: 'text' }).subscribe(text => {
    const result = text
    self.sendLog(result)
  })
}
```

## References

[HttpClient](https://angular.io/guide/http)
[Angular 4.3で追加されたHttpClientModuleについてのメモ](https://qiita.com/ponday/items/1ec0e500cd801286845e)
[httpbin(1): HTTP Request & Response Service](https://nghttp2.org/httpbin/)
[Angular v4.3 で追加された HttpClient を使ってみた](http://neos21.hatenablog.com/entry/2017/08/09/080000)
