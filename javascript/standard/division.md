## Division in JavaScript

他言語と同様の整数を返す場合

```js
console.log(54 / 10 | 0);
// 54 / 10 | 0
// => 5
```

## Example

Referenced from [JavaScriptとJavaでは整数の割り算結果が違う](https://qiita.com/mitsuru793/items/1d6ac188fa3bc055ea8d),

```java
// Javaで整数の割り算
public class Test {
    public static void main(String[] args) {
        System.out.println(54 / 10);
    }
}
// => 5
```

```js
// JavaScriptで整数の割り算
console.log(54 / 10);
// => 5.4
```

[JavaScriptとJavaでは整数の割り算結果が違う](https://qiita.com/mitsuru793/items/1d6ac188fa3bc055ea8d)
