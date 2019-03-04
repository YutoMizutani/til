## Get raw JSON using Alamofire

```swift
Alamofire.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: URLEncoding.default)
     .responseData {
         switch $0.result {
         case .success:
             guard let data = $0.data else { return }
             let json: Srting = String(data: data, encoding: .utf8) ?? ""
         case .failure(let error):
             break
         }
     }
```

[How to get the raw JSON from an API call](https://stackoverflow.com/questions/50341111/how-to-get-the-raw-json-from-an-api-call)
