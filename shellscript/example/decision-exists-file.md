## Decision exists file

#### if exists

```sh
FILE="test.txt"

if [ -e $FILE ]; then
  echo "File exists."
fi
```

#### if NOT exists

```sh
FILE="test.txt"

if [ ! -e $FILE ]; then
  echo "File not exists."
fi
```

[【シェルスクリプト】ファイルやディレクトリの有無を確認する方法色々](https://www.server-memo.net/shellscript/file_check.html)
