## Line break mode in NSAtrributedString

> NSMutableParagraphStyleにもlineBreakModeが存在する

> まさかとは思うんだがスタイルで改行モードを指定せずラベルに指定してないか？
NSMutableParagraphStyle *paragrahStyle = [NSMutableParagraphStyle new];
paragrahStyle.minimumLineHeight = customLineHeight;
paragrahStyle.maximumLineHeight = customLineHeight;
paragrahStyle.lineBreakMode = NSLineBreakByTruncatingTail; // 追加
共有この回答を改善する
回答日時: 15年9月4日 0:27
user10678
すみません、ありがとうございます。 その通りで、無事に省略文字が付与されました。 原因は２つでした。 1.その前にラベルを使用していた為、TrancateTailの設定をUILabel側のみにしていたので、問題ないと思っていた。（.xib側に設定） 2.NSMutableParagraphStyleにもlineBreakModeが存在することを知らなかった。 大変助かりました。 – GQ34 15年9月4日 0:55

[NSMutableAttributedStringを使用し、UILabelで複数行表示させると、…（三点リーダ）が表示されない](https://ja.stackoverflow.com/questions/15188/nsmutableattributedstringを使用し-uilabelで複数行表示させると-三点リーダ-が表示されない)
