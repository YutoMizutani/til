## Replace absolute URL

```ruby
class Api::V1::FooController < ApplicationController

  def index
    @arr = Foo.all
    @arr.each_with_index do |foo, i|
      # 相対パスを絶対パスに変更してURLアクセス可能なパラメータに変換する
      absolute_url = helpers.asset_url(foo["url"])
      @arr[i]["url"] = absolute_url
    end
  end

end
```
