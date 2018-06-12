## Install Ruby on Rails on Windows

[rubyinstaller.org](https://rubyinstaller.org/)から、環境に合った`.exe`ファイル(e.g. `rubyinstaller-devkit-2.4.4-1-x64.exe`)
をダウンロードする。

```
> gem update --system
> gem install bundler
> gem install rails --no-ri --no-rdoc
```

[rubyinstaller.org](https://rubyinstaller.org/)
[Ruby on Rails 4.2 を Windows にインストールする手順をかなり丁寧に説明してみました](https://www.oiax.jp/rails/zakkan/rails_4_2_installation_on_windows.html)
[Ruby on Railsのインストールと設定](https://qiita.com/yu-yan/items/6e693caf23054c6ba9a1)
[RubyGemsでgemのインストール時に--no-ri --no-rdocをデフォルトにする](http://blog.ruedap.com/2011/05/14/ruby-gem-install-no-ri-no-rdoc-gemrc)
