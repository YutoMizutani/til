## Update seeds

Update `db/schema.rb` or `db/seeds.rb`,

```sh
$ rake db:reset
```

```sh
$ sudo mysql.server && rake db:reset && bin/rails s
```

> So rake db:reset => db:drop db:create db:schema:load db:seed

[Rails migration does not change schema.rb](https://stackoverflow.com/a/20466732)
