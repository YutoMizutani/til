## Run with background

```
$ sudo docker run -d <foo>:<TAG or IMAGE ID; if null -> latest>
```

If display logs,

```
$ sudo docker logs <CONTAINER ID>
```

If return forground,

```
$ sudo docker attach --sig-proxy=false <CONTAINER ID>
```
