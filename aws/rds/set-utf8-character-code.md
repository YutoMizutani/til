## Set UTF8 character code for AWS RDS

## パラメータグループの設定

[日本人ならRDSを使う際にかならずやらなければならないこと](http://ria10.hatenablog.com/entry/20130619/1371603765)
> DB Parameter Groups概要
> ざっと要約すると
>
> "DB Parameter Groups"は言ってみれば設定のコンテナ。個別のDBインスタンスに適用することによって反映される。
> DBインスタンス作成時にDB Parameter Groupsを指定しなければ、デフォルトのDB Parameter Groupsが適用される
> デフォルトのDB Parameter GroupsはDBエンジン、インスタンスタイプ、ストレージ容量を元に設定される
> 自分で"DB Parameter Groups"を設定したかったら新規にDB parameter groupを作って、それをDBインスタンスに適用すればよい
> DB parameter groupを変更すれば、それが適用されているすべてのインスタンスに変更が反映される
> すでに稼働しているDBに反映させるにはRebootが必要
> 設定がアレだと、インスタンスが落ちたり、パフォーマンスが落ちたりするので注意
> DB Parameter Groupの作成
> AWS Management ConsoleからRDS設定画面に行くと、ナビに"DB Parameter Groups"があるのでそこから作る。
> ちなみにここでデフォルトの設定内容が確認でき、たとえばinnodb_buffer_pool_sizeは{DBInstanceClassMemory*3/4}という基準で設定されていることがわかったりする。このデフォルトのパラメータをいじることもできるけど、怖いからやらない。
>
> 「Create DB Parameter Group」ボタンおす
> DB Parameter Group Family: mysql5.5を選択
> DB Parameter Group Name: テキトウに入れる(utf8mb4 と入れた）
> DB Parameter Group Description:テキトウに入れる(modify charset to utf8mb4 と入れた)
> 「Yes create」ボタンおす
> 一覧に戻るので今作った"utf8mb4"を選択して「Edit parameter」ボタンを押す
> 以下の項目のカラムに"utf8mb4"と入力
> character_set_database
> character_set_client
> character_set_connection
> character_set_results
> character_set_server
> 「Save changes」ボタンをおす
> DB Parameter Groupの適用
> さっき作ったDB parameter groupをインスタンスに適用する。今回はすでに稼働しているインスタンスを対象にする。さっきも書いたけどリブート入るんでそこんとこ夜露死苦。
>
> ナビから"Instances"選択
> DB parameter groupを適用するインスタンスを選択し、「Instance Actions」プルダウンから「Modify」を選択
> Parameter Groupをさっき作った"utf8mb4"に変更
> すぐリブートしていいときはApply Immediatelyにチェックを入れる
> 「Continue」→「Modify DB Instance」

## 確認

[RDSで日本語が文字化けする問題](https://qiita.com/reoy/items/e355debf1e2b2abd703b)
```
$ mysql -u ユーザー名 -p -h xxx.xxxxxxxxxx.ap-northeast-1.rds.amazonaws.com データベース名
mysql> show variables like 'char%';
```

## UTF8に手動で変える

[RDSで日本語が文字化けする問題](https://qiita.com/reoy/items/e355debf1e2b2abd703b)
```
mysql> ALTER TABLE テーブル名 CONVERT TO CHARACTER SET utf8mb4
```

[日本人ならRDSを使う際にかならずやらなければならないこと](http://ria10.hatenablog.com/entry/20130619/1371603765)
[RDSで日本語が文字化けする問題](https://qiita.com/reoy/items/e355debf1e2b2abd703b)
[データベースのutf8mb4対応](https://qiita.com/Iwark/items/9499fcc4e3a3e50afe08)
[MySQL で utf8 と utf8mb4 の混在で起きること - @tmtms のメモ](https://tmtms.hatenablog.com/entry/2016/09/06/mysql-utf8)
