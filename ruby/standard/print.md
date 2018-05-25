## print

#### print

```ruby
print "Hello, "
print "world!!"
# Hello, world!!
```

#### puts

```ruby
puts "Hello, "
puts "world!!"
# Hello,
# world!!
```

#### p

*p* は型情報も含まれる。

```ruby
p "Hello, "
p "world!!"
# "Hello,"
# "world!!"
```

#### printf

*%s* は文字列, *%d* は数値。

```ruby
printf("Hello, %s", "world!!")
# Hello, world!!
```

#### sprintf

*printf* をstringにする。

```ruby
puts sprintf("Hello, %s", "world!!")
# Hello, world!!
```

[【Ruby入門】print puts p printf 出力メソッドを極める！](https://www.sejuku.net/blog/16119)
