## Revert

[Gitのrevertの-m(mainline)オプションについて](https://blog.toshimaru.net/git-revert-mainline/)
> git revertしているとこんなエラーに出くわしました。
>
> $ git revert xxxxx
> error: Commit xxxxx is a merge but no -m option was given.
> fatal: revert failed
> 「コミットxxxxxはマージだけど、-mが指定されていないよ！」ってことなんですがどういうことでしょう> ？
>
> 普通に考えてみると当然のことで、マージコミットですからrevertといったときにどのブランチ状態に戻る> かを指定しなければrevertできないよということです。つまり下記のようなヒストリーがあったときに、
>
> *   1459267 - Merge pull request #4 from branch3
> |\
> | * 344fd52 - (branch3) Add sentence
> | * 2b30235 - add file
> * | dbc65f4 - add revert commit2
> * | f0b0a91 - add revert commit 1
> <1459267>のマージをrevertした場合に、<344fd52>か<dbc65f4>かどっちに戻すかがわかんないっち> ゅうことです。
>
> このmainlineは1から始まり「1がマージされた側のブランチ」「2がマージする側のブランチ」になるよう> なので多くの場合、前者に戻したいと思うので1を指定しとけばよいということになります。結果としては下> 記のコマンド。
>
> $ git revert -m 1 1459267
> 以上でした。

[Gitのrevertの-m(mainline)オプションについて](https://blog.toshimaru.net/git-revert-mainline/)
[【gitコマンド】いまさらのrevert](https://qiita.com/chihiro/items/2fa827d0eac98109e7ee)
