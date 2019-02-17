## MarshalJSON

```go
import (
	"encoding/json"
	"log"
)

func MarshalJSON(v interface{}) (*interface{}, error) {
	bytes, err := json.Marshal(&v)
	if err != nil {
		log.Fatal("Error JSON marshaling:", err)
		return nil, err
	}

	// jsonString := string(jsonBytes)
	// jsonString := *(*string)(unsafe.Pointer(&jsonBytes))
	// return &jsonString, nil

	// buffer := new(bytes.Buffer)
	// json.HTMLEscape(buffer, jsonBytes)

	// buffer := new(bytes.Buffer)
	// err = json.Indent(buffer, jsonBytes, "", "    ")
	// if err != nil {
	// 	log.Fatal("Error JSON indent:", err)
	// 	return nil, err
	// }
	//
	// jsonString := buffer.String()
	// return &jsonString, nil

	var dat interface{}
	err = json.Unmarshal(bytes, &dat)
	if err != nil {
		log.Fatal("Error JSON unmarshaling:", err)
		return nil, err
	}

	return &dat, nil
}
```
