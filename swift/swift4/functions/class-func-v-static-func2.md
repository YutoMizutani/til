## class func v. static func 2

より詳細に、変数がメモリの使用に変動を及ぼすかを調査する。

調査対象は以下の2点。
- (final class funcとstatic funcで) ローカル変数のメモリ割り当てが変化するか
- (final class funcとclass funcで) メモリ使用期間が変化するか

https://www.reddit.com/r/swift/comments/472tfj/class_func_vs_static_func/
https://qiita.com/shtnkgm/items/c985ab4b314b8572eccd
http://blog.andgenie.jp/articles/843

sil_vtable(vtable)
  https://ja.wikipedia.org/wiki/%E4%BB%AE%E6%83%B3%E9%96%A2%E6%95%B0%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB
  http://sugawarayusuke.hatenablog.com/entry/2018/01/08/185229
function_ref
  http://llvm.org/docs/ProgrammersManual.html
動的ディスパッチ
  https://books.google.co.jp/books?id=pzXkGbMibQUC&pg=PA244&lpg=PA244&dq=%E5%8B%95%E7%9A%84%E3%83%87%E3%82%A3%E3%82%B9%E3%83%91%E3%83%83%E3%83%81+%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9&source=bl&ots=A7nKjTWxUe&sig=hRgYLTb2JgHuuWrAqxNrlYtp8C0&hl=ja&sa=X&ved=0ahUKEwjxs7Lr1KnbAhUJw7wKHcxhDfsQ6AEIQDAD#v=onepage&q=%E5%8B%95%E7%9A%84%E3%83%87%E3%82%A3%E3%82%B9%E3%83%91%E3%83%83%E3%83%81%20%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9&f=false
  https://qiita.com/yutaro1204/items/8e19ca364ecba5c67ee5


[Swiftのfinal・private・Whole Module Optimizationを理解しDynamic Dispatchを減らして、パフォーマンスを向上する](https://qiita.com/mono0926/items/f5f271b7d2bde68207b2)

By Apple,
  https://swift.org/blog/osize/
  https://developer.apple.com/swift/blog/?id=27
  https://github.com/apple/swift/blob/master/docs/OptimizationTips.rst
