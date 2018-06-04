## Get match files

pathからnameに合致するitemを出力する。

```ruby
def getMatchFiles(path, name)
  Dir.glob("#{path}/**/#{name}") do |item|
    puts item
  end
end

if __FILE__ == $0
    getMatchFiles("..", "*.rb")
end
```

* https://maku77.github.io/ruby/find-files.html
* https://qiita.com/raccy/items/1168c7e8849dedf70fa4
* https://www.sejuku.net/blog/19669
