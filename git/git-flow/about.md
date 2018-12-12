## Git flow

長期化プロジェクトのため，前から気になっていたgit-flowを導入することにした。

created on 2018/01/17

- References
    - Git flow
        - https://qiita.com/tanishi/items/09e72c65c0a0c9e1cc10
        - https://qiita.com/takaaki4cards/items/a35de884134c6471a4ed
        - https://qiita.com/KosukeSone/items/514dd24828b485c69a05
        - https://qiita.com/shyamahira/items/f2fafb8de1517a4cf5ff
    - commit移動
        - https://qiita.com/kmdsbng/items/73614ed39d6f65d740db
        - http://labs.timedia.co.jp/2010/12/git-moving-changes-with-cherry-pick.html
    - branch移動
        - https://qiita.com/atskimura/items/a90dfa8bfc72e3657ef9

- インストール
    $ brew install git-flow

- 既にgitを利用していた。これまでのcommitを消さずに，develop branchにこれまでのものを移動させる形で変更する。
    - Initial commitの場所にbranchを作成する。
    - 作成するbranchは develop で，他は git flow init で初期化される。
        - Initial commitはSourcetreeより「ed7c489」であった。
            - $ cd /Users/ym/Documents/UserFile/Programs/Swift/Swift4/iOS/OCA/DevelopVersion/OperantChamberApp
            - $ git branch develop ed7c489
        - 確認。
            - $ git branch
        - 間違えた場合は
            - $ git branch --delete (branch名)
            - mergeで怒られる場合，強制削除は
                - $ git branch -D (branch名)
            - で削除。
    - branchをdevelopに切り替える。
        - $ git checkout develop
            - （Xcodeを開いたままにしていたため，色々消えて焦る。）
    - 移したいコミットをcherry-pickコマンドでコピー
        - $ git cherry-pick 0623358
        - ・・・しようと思ったが，commit idをコピペするよりSourcetreeの右クリックの方が早かったため，そちらでコピー。
    - masterに移動してcommitを削除。
            - $ git checkout master
        - 17の直前のcommitを削除。
            - $ git reset --hard HEAD~17

- 準備ができたので，Git-flowを入れる。
    - git-flow導入。
        - $ git flow init
            - $ git flow init -f で強制初期化
            - 全てEnterで進む。
- featureの作成
    - featureは複数成り立つ。feature branchを新たに作成する。
        - $ git flow feature start (作成するfeature branch名)
            - （git flow init前に feature branchを手動で作成していてエラーが起きた。）

- merge
    - $ git checkout develop
    - $ git merge --no-ff feature/(branch name)




http://ikeike443.hatenablog.com/entry/20101128/p1
