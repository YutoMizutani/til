## NSKeyedArchiver

[NSKeyedArchiver](https://developer.apple.com/documentation/foundation/nskeyedarchiver)
> A coder that stores an object's data to an archive referenced by keys.

例えば、画像編集などを行う際にUndoやRedoを利用しようとして、
過去に編集したUIImageを配列に保存しようとすると、すぐにメモリ不足に陥りアプリが落ちてしまう。

画像等の大きなものは、メモリ上ではなく端末内のストレージに保存する。

[iOSの画像加工アプリでUndoRedoの実装 (NSCodingの話とか)](https://qiita.com/koitaro/items/e9049171eb172df20505)
> ## NSCoding
> iosプログラミングをしていると、NSCodingという記述をちょいちょい見かけることがあるのではないでしょうか。
> 簡単に説明すると「インスタンスの状態をそのままファイルとして保存できる仕組みを提供してくれるクラス」です。

[decodeObject(forKey:)](https://developer.apple.com/documentation/foundation/nskeyedunarchiver/1409082-decodeobject)
[NSKeyedArchiver](https://developer.apple.com/documentation/foundation/nskeyedarchiver)
[iOSの画像加工アプリでUndoRedoの実装 (NSCodingの話とか)](https://qiita.com/koitaro/items/e9049171eb172df20505)
[Swiftでのデータ永続化](http://developer.wonderpla.net/entry/blog/engineer/Swift_DataPersistence/)
