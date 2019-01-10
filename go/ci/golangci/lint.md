## GolangCI lint

> golangci-lint/.golangci.yml

```yml
linters-settings:
  govet:
    check-shadowing: true
  golint:
    min-confidence: 0
  gocyclo:
    min-complexity: 10
  maligned:
    suggest-new: true
  dupl:
    threshold: 100
  goconst:
    min-len: 2
    min-occurrences: 2
  depguard:
    list-type: blacklist
    packages:
      # logging is allowed only by logutils.Log, logrus
      # is allowed to use only in logutils package
      - github.com/sirupsen/logrus
  misspell:
    locale: US

linters:
  enable-all: true
  disable:
    - maligned
    - prealloc
    - gosec
```

[golangci/golangci-lint](https://github.com/golangci/golangci-lint)
