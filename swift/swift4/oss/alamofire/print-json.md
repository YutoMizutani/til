## Print JSON using Alamofire and SwiftyJSON

#### Required

In Cartfile,

```
github "Alamofire/Alamofire"
github "SwiftyJSON/SwiftyJSON"
```

#### Usage

```swift
import Alamofire
import SwiftyJSON

let url: String
let method: HTTPMethod = .get
let parameters = Parameters()

Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
            .responseJSON { response in
                guard let value = response.result.value else { return }
                let json = JSON(value)
                dump(json)
            }
```

#### References

- [Reading in a JSON File Using Swift](https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift/51264815)
- [Alamofireを使ってAPIからJSONを取得する](https://swiswiswift.com/2017/07/09/alamofire-api/)
