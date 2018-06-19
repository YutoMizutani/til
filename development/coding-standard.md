# コーディング規約

<hr>

## はじめに
大抵の言語には公式ドキュメントが存在し、言語仕様やアーキテクチャに沿った命名規則が存在、推奨されている場合が多い。
変数名は英単語と公式APIの慣れで基本は解決出来ると判断したため、本記事では主に接頭辞とケースについて触れたい。

<hr>

## 全般的な参考リンク
- [うまくメソッド名を付けるための参考情報](https://qiita.com/KeithYokoma/items/2193cf79ba76563e3db6)
- [やはりお前らの真偽値メソッド名は間違っている。 〜「Xxx できる？」系メソッドの命名〜](https://qiita.com/lovee/items/aa2125eb0bce4a9dde1f)

<hr>

## Swift
個人的な規約を例に。
- e.g.
  - ID(ローカル変数, 定数, 整数型)
    ```swift
    private let id: int = 100
    ```
  - 稼働状態(グローバル変数, 真偽値)
    ```swift
    public var isRunning: Bool = false
    ```
  - protocol(他言語でのinterface)
    ```swift
    protocol writable {}
    ```
Swiftは静的型付け言語である。Xcodeでの開発が基本で、IDE上で静的解析が常に行われる。そのため、カーソルを合わせるだけでそのクラスの情報、型を読むことが出来る特色がある。そのため、変数名に型の情報や定数・変数の区別を含める必要がない。基本的にテスト時でなくコーディング時に間違いに気づくよう設計されている。
- [【Swift】コーディング規約まとめ](https://qiita.com/KentaKudo/items/b48762a0d6adfbf62579)

## Python
Pythonはスコープが波括弧でなくインデントである。Pythonとしてはそれが読みやすい ~~個人的には大変読みにくい~~ としている。
また、pep8と呼ばれる規約が一般的。
- e.g.
  - ID(ローカル変数, 定数, 整数型)
    ```python
    _ID: int = 100
    ```
  - 稼働状態(グローバル変数, 真偽値)
    ```python
    is_running: Bool = false
    ```
- [pythonのインデント](http://studylog.hateblo.jp/entry/2015/10/22/043739)
- [Python のコーディング規約 PEP8 に準拠する](https://qiita.com/ynakayama/items/8616f4c0c6e372de9a42)
- [はじめに — pep8-ja 1.0 ドキュメント](http://pep8-ja.readthedocs.io/ja/latest/)

### Haskell
Haskell等の関数型言語では、genericsにより型を意識しない記述も多く、1文字変数も多く見かける（長くなるので割愛）。ドキュメントの書き換えを行うpandocが有名だが、そこでも以下のような変数を利用している。
- [Haskell - 個人的な(そして異端的な)コーディングスタイル](https://qiita.com/YoshikuniJujo/items/2db33a90b7252c817baa)
- [pandoc - CSS.hs](https://github.com/jgm/pandoc/blob/master/src/Text/Pandoc/CSS.hs)

### Javascript
- [スタイルガイドや命名規則記事まとめ( JavaScript )](https://qiita.com/kitsuki00/items/79428876391d0179a2ca)
- [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
- [Google JavaScript Style Guide 和訳](http://cou929.nu/data/google_javascript_style_guide/)

### html
- [HTMLとCSSクラスでよく使う命名について](https://qiita.com/pugiemonn/items/eaa597b79fe59a1f1506)

<hr>

## ケース論争
- [変数名の命名規則/＊＊ケースの使い分け](https://qiita.com/am_nimitz3/items/7b01af53751dba5d8fb1)

一方で、コンパイルされプログラムには影響を与えない部分のため、定まることはないだろう。
定まっていない以上論争は絶えない。複数語の連結をアンダースコアにするか、大文字にするかの場合、
- [キャメルケースよりスネークケースで。](http://pg-kura.hatenablog.com/entry/20120118/1326892870)

上記ではスネークケースを推しているが、私はキャメルケース派である。

アンダースコアによる区分は日本語キーボードでは「Shift+￥」に対し、英USキーボードではShift不要で入力出来る。入力のコスト面からも自分に合ったスタイルを追求すべきであろう。

余談であるが、SKKと言われる爆速日本語入力システムの入力方法がパスカルケースライクなため、入力システムからの変数宣言、運指が宗教に繋がっている可能性も十分に考えられる。
- [SKKとは (エスケイケイとは) - ニコニコ大百科](http://dic.nicovideo.jp/a/skk)

BASIC時代には大文字、アンダースコアしか入力できなかった背景から、VB等の大文字小文字を区別しない歴史を引き継いでいる言語もある。

<hr>

## それでも困った時は
良く使われる変数名一覧がある、また、変数名を日本語から検索可能なサービスも存在する。
GitHubのOSSを検索して、他のエンジニアがどう書いているのかを検索するなどもよく言われる。
「困ったらソース嫁」
- [プログラミングでよく使う英単語のまとめ【随時更新】](https://qiita.com/Ted-HM/items/7dde25dcffae4cdc7923)
- [codic: プログラマーのためのネーミング辞書](https://codic.jp/)
- [プログラムのネーミングに迷ったとき Alfred Workflows を使って、もっと手軽に GitHub でコード検索する](https://qiita.com/takasek/items/7f66dff862c8fa9360da#_reference-7d035293b83523f6f882)

<hr>

## 所感
言語ごとに規約を設定したほうが良いという立場に立つが、一方で、チーム開発での未経験者が他言語へのハードルを下げるために統一する、という手法は時に合理的であると考え直した。~~闇の深いスパゲッティソースでは変数名情報は間違った変数名よりも有益な情報となり得る。~~

<hr>

## 結語
- [コーディング規約チェックを日常に〜無理なくチーム全員で取り組める仕組みを作ろう](https://shimoju.org/2016/12/04/step-by-step-code-linting/)
- [形骸化しないコーディング規約のために](https://qiita.com/Mic-U/items/c4704bab8a289e938a45)
- [コーディング規約の作り方の基本とメリット・デメリット](https://furien.jp/columns/185/)

Google等の企業単位でGitHubにコーディング規約を掲載している場合も多い。

また、コーディング方法のブレを防ぐために、lint等の静的コード解析ツールの利用によってコーディング時にチェックできるものも存在する。IDEやプラグインの導入によって、コーディング時に自然に統一可能な手法も存在する。

Pythonのpep8関連のプラグインにより、変数名の前にアンダースコアを記述することで、アクセス権限がprivateに変更されるという仕様も加えられるため、安易にオレオレ規約を作成するよりは、言語仕様に沿った命名を行うのが望ましい。
