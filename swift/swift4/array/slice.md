## Slice array

```swift
let array = ["a", "b", "c", "d", "e"]
let s1 = array.prefix(0) // []
var s2 = array.prefix(2) // ["a", "b"]
let s3 = array.prefix(10) // ["a", "b", "c", "d", "e"]

let s4 = array.suffix(0) // []
let s5 = array.suffix(2) // ["d", "e"]
let s6 = array.suffix(10) // ["a", "b", "c", "d", "e"]
```

[SwiftのArrayをスライスする](https://tech-blog.sgr-ksmt.org/2016/03/16/array_slice/)
