## Getting Standard input in Swift


#### Standard input

```swift
let input: String? = readLine()
```

#### Pipe

```swift
let input: String? = String(data: FileHandle.standardInput.availableData, encoding: .utf8)
```
