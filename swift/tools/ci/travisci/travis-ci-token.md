## Travis CI token

> *** Skipped downloading RxSwift.framework binary due to the error:
>        "Maximum number of login attempts exceeded. Please try again later."

> A personal access token (temporary token to identify with the travis command line client against https://api.travis-ci.org/) with read:org, repo:status, repo_deployment, user:email, and write:repo_hook scopes was recently added to your account. Visit https://github.com/settings/tokens for more information.

$ travis login --pro
$ travis login --auto
$ travis encrypt --pro GITHUB_ACCESS_TOKEN=<foo> --add

[Travis CI+Carthageでprebuilt frameworkがダウンロードされない場合の対処法](https://qiita.com/hironytic/items/83c77c63cf5b0b262f89)
[repository not known #2334](https://github.com/travis-ci/travis-ci/issues/2334)
[not logged in, please run travis login --pro #6146](https://github.com/travis-ci/travis-ci/issues/6146)
[https://github.com/travis-ci/travis.rb/issues/529](https://github.com/travis-ci/travis.rb/issues/529)
