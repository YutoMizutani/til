## Docker stop by name

```
$ docker stop $(docker ps -q --filter ancestor=<name>)
```
