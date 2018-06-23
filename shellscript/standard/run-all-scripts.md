## Run all scripts

#### Find ShellScript

```sh
for file in `\find . -name '*.sh'`; do
    sh $file
done
```

#### Tutorial

```sh
$ cd ~
$ mkdir myscripts/sh && cd myscripts/sh
$ cat << 'EOT' > hello.sh
echo "Hello, world!!"
EOT
$ cp hello.sh hello2.sh
$ cd ..
$ cat << 'EOT' > run.sh
for file in `\find ./sh/ -name '*.sh'`; do
    sh $file
done
EOT
$ sh run.sh
$ cd .. && rm -rf myscripts
```

[shell でディレクトリ内のファイルに対してループ処理](https://qiita.com/elzup/items/e839a8c4e815808fb4bc)
