## docker-compose in GoLang

```yaml
version: '2'

services:
  app:
    image: 'golang:1.11'
    ports:
    - '8585:8585'
    volumes:
    - '.:/root/go/src/github.com/{YOU-USER-NAME}/{APP-NAME}/'
    working_dir: '/root/go/src/github.com/{YOU-USER-NAME}/{APP-NAME}/'
    command: bash -c 'go mod download && go run main.go'
    environment:
    - 'GO111MODULE=on'

volumes:
  data:
    driver: 'local'
```

[Golangをdocker-composeで動かすdocker-compose.yml](https://qiita.com/Azunyan1111/items/7603843f9716398cd8f5)
