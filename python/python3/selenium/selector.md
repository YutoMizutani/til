## Selector

> 要素のxPathを取得して指定する方法ではどうでしょう？
> タグ構造の作りによっては複雑なxPathになる可能性はありますが･･･とりあえず要素を取得してコードを動かすという目的は達成できるかと。
> xPathはChromeに標準で付属している[ツール]→[デベロッパーツール]で簡単に取得できます。
>
> ＜ChromeでのxPath取得方法＞
> 取得したい箇所を右クリック→「要素を検証」を選び、出てきたタグのウィンドウから該当箇所を右クリック→Copy XPathを選択。（クリップボードにコピーされます）
>
> ＜WebDriverのxPath指定例＞
>
> driver.findElement(By.xpath("//*[@id='srchtxt']")).sendKeys("あああ");
>
> "//*[@id='srchtxt']"がxPathの部分です。
> （xPath中にダブルクォーテーションが含まれる場合はシングルクォーテーションに変えてください。）

[Seleniumでidが振られていない要素を取得できない](https://teratail.com/questions/3299)
[Selenium の locator とうまくつきあうための話](https://qiita.com/okitan/items/cdf8809405821e057609)
