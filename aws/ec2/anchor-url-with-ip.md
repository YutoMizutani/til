#### Anchor the connecting URL

[https://dotinstall.com/lessons/basic_aws/9508](https://dotinstall.com/lessons/basic_aws/9508)
> 前回イメージを作る時に EC2 をシャットダウンしましたが、そうすると Instance の URL が変わってしまいます。
> > 補足情報 【訂正】AMI作成時にIPアドレスは変わりません	2012年11月13日
> > 
> >動画の最初で「イメージを作成するときにシャットダウンしたので...アドレスが変わる」と説明していますが、AMI作成時は「Reboot」が実行されるのでIPアドレスは変わりません。ここは誤りでしたので訂正しておきます。

1. Elastic IP/新しいアドレスの割り当て/割り当て
2. Getted Elastic IP <....>
3. アドレスの関連付け

*WARNING* <br>
[https://dotinstall.com/lessons/basic_aws/9508](https://dotinstall.com/lessons/basic_aws/9508)
> EC2 に結びついていない IP アドレスは課金されてしまうので、使わない場合は必ず「Release Address」で Release しておきましょう。


*WARNING* <br>
IPが紐付いていない状態は，EC2が停止中でも生じるため注意！！