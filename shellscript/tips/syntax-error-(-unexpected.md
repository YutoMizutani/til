## Syntax error: "(" unexpected

`$ sh foo.sh`の実行時に、

```
Syntax error: "(" unexpected
```

というエラーが発生した。

foo.sh
```sh
#!/bin/sh

array=()
```

()を使用してはいけないらしい......`dash`では。

#### 解決方法

1. `#!/bin/bash`に変更する。

  foo.sh
  ```sh
  #!/bin/bash

  array=()
  ```

2. bashでshellscriptを呼ぶ。

  ```
  $ bash foo.sh
  ```

[意外な理由（？）で「Shell script arrays Syntax error: “(” unexpected」](https://pc.casey.jp/archives/153904527)
