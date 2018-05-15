## Sleep

```typescript
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time))
}
sleep(1000).then(() => {
  console.log("Hello, world!!")
})
```
