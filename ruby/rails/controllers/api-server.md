## API server

`app/controller/api/v1/foo_controller.rb`

```ruby
class Api::V1::FooController < ApplicationController

  def index
    @attractions = Foo.all
    @attractions.each_with_index do |attraction, i|
      # 相対パスを絶対パスに変更してURLアクセス可能なパラメータに変換する
      absolute_url = helpers.asset_url(attraction["movie_url"])
      @attractions[i]["movie_url"] = absolute_url
    end
  end

end
```

And add endpoints
`app/config/routes.rb`

```ruby
Rails.application.routes.draw do
  # APIs
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :foo
    end
  end
end
```

[[Rails] APIサーバーを立ててみる](https://qiita.com/y-agatsuma/items/782ecb2096a68322ea4e)
