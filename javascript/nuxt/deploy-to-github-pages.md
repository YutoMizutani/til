## Deploy to github pages

```sh
$ npm install push-dir --save-dev
```

> deploy コマンドを package.json に追加してください。ブランチは、プロジェクトリポジトリならば gh-pages ブランチ、ユーザーまたは組織サイトならば master ブランチを指定してください。

```package.json
"scripts": {
  "dev": "nuxt",
  "build": "nuxt build",
  "start": "nuxt start",
  "generate": "nuxt generate",
  "deploy": "push-dir --dir=dist --branch=gh-pages --cleanup"
},
```

```sh
$ npm run generate
$ npm run deploy
```

[GitHub Pages へデプロイするには？](https://ja.nuxtjs.org/faq/github-pages/)
