## git branch using git flow


- masterの直前commitを別のbranchを生成して直す。
    - git-flow, feature 使用
-  BLEperipherals develop
func movefeature () {
    git flow feature start $1 && \
    git checkout $2 && \
    git reset --hard HEAD~1
}

git flow feature start BLEperipherals && \
git checkout develop && \
git reset --hard HEAD~1



（直前のcommitが同一（merge直後）な二つのブランチの）
別のブランチで開発してしまったものを，もう1方のブランチでコミットする
 keywords: git stash (一時保存)
 - References
     - http://digape.com/201202/git-%E4%BB%8A%E3%81%AE%E7%8A%B6%E6%85%8B%E3%82%92commit%E3%81%9B%E3%81%9A%E3%81%AB%E5%88%A5%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E3%82%92checkout%E3%81%97%E3%81%9F%E3%81%84/
     - https://qiita.com/shuntaro_tamura/items/6c8bf792087fe5dc5103
$ git stash
$ git branch (確認)
$ git checkout feature/CumulativeRecorderUsingCharts
$ git stash list (確認)
$ git merge develop
$ git stash pop
$ git add .......

- 新しくbranchを作成する場合
$ git stash
$ git flow feature start ()
$ git stash pop
$ git add .....
