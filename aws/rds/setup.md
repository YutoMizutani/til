## Setup

### Create an instance

1. Login and go EC2 with region: Tokyo
2. Launch Instance
3. Select MySQL
4. Select free settings
	1. Set DB Instance Identifer (DB インスタンス識別子): ※1
	2. Set Master Username:
	3. Set Master Password:
5. Database settings
	1. Availability Zone (アベイラビリティーゾーン): ※2
	2. Set Database Name (データベースの名前): 

※1: *WARNING*
[https://ap-northeast-1.console.aws.amazon.com/rds/home?region=ap-northeast-1#launch-dbinstance:ct=gettingStarted:](https://ap-northeast-1.console.aws.amazon.com/rds/home?region=ap-northeast-1#launch-dbinstance:ct=gettingStarted:)
> DB インスタンス識別子は大文字と小文字の区別がありませんが、"mydbinstance" のようにすべて小文字で保存されます。1 ～ 63 文字の英数字またはハイフンを含める必要があります (SQL Server の場合は 1 ～ 15 文字)。1 字目は文字である必要があります。ハイフンを、文字列の最後に使用したり、2 つ続けて使用したりすることはできません。

※2: EC2から利用する場合は同じものを選択
