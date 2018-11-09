## Fit to top UITextView

To change frame.y

> 解決方法
UITextViewのframe.origi.yをいじるだけ。

UITextViewは上寄せができない！
日本語の情報も出てこず、「UITextView uitextview vertical alignment」でぐぐってcontentsOffsetなんかをいじりはじめたら確実に泥沼にハマります。ハマりました。
5時間ぐらい時間を棒に振りました。やると無限に不具合が発生します。
（スクロールさせないTextViewを上寄せしたいだけなら問題ありませんが）
絶対やっちゃだめです。
そんなことしなくても解決可能です。

TextView内の文字が表示されはじめるy座標の位置は固定なんです。
しかも、文字の量がいくら増えても最初の行のy座標は上にずれず、固定なんです。
つまり解決方法はただ１つで、最初の行のy座標が意図したところにくるまで、TextViewのframe.origin.yを調節するだけです。
場合によってはマイナス値を取らないといけない場合もありそう。
これで何もかも全て解決します。
TextViewのサイズを可変にした場合もy座標の位置さえ変えなければまったくずれません。オールオッケーです。

追記 2016/11/29
はてなブックマークのコメントによると
objective c - UITextView text content doesn't start from the top - Stack Overflow
という方法も一応あるそうです。私は読んでおりません。
情報ありがとうございます。

[「UITextView 上寄せ」とググろうとしているあなたへ](http://d.hatena.ne.jp/SOTOCHA/20140622/1403433455)
