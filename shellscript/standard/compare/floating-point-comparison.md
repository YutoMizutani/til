## Floating Point Comparison in Shell Script

```sh
key1="12.3"
result="12.2"
if [ $(bc <<< "$result <= $key1") -eq 1 ]
    then
    # some code here
fi
```

[Floating Point Comparison in Shell Script](https://stackoverflow.com/a/2424856)
