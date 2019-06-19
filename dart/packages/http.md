## http 0.12.0+2

Use this package as a library

#### 1. Depend on it

Add this to your package's pubspec.yaml file:

```
dependencies:
  http: ^0.12.0+2
```

#### 2. Install it

You can install packages from the command line:

with pub:

```
$ pub get
```

with Flutter:


```
$ flutter pub get
```

Alternatively, your editor might support pub get or flutter pub get. Check the docs for your editor to learn more.

#### 3. Import it

Now in your Dart code, you can use:

```dart
import 'package:http/http.dart';
```

#### example/main.dart

```dart
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

main(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = "https://www.googleapis.com/books/v1/volumes?q={http}";

  // Await the http get response, then decode the json-formatted responce.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print("Number of books about http: $itemCount.");
  } else {
    print("Request failed with status: ${response.statusCode}.");
  }
}
```

[http 0.12.0+2 pub.dev](https://pub.dev/packages/http#-installing-tab-)
