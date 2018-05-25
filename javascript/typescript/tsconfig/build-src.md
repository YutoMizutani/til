## Setting build source in TypeScript

*config.json*ファイルで指定する。

#### outDir

出力先のPathを指定する。

#### rootDir

出力元のPathを指定する。

#### config.json

```json
{
  "compilerOptions": {
    /* 省略 */
    "outDir": "./<foo>",
    "rootDir": "./<bar>",
    /* 省略 */
  }
}
```

[TypeScriptでビルド時JavaScriptを任意の場所に出力する](http://mriv.hateblo.jp/entry/2016/06/20/205515)
