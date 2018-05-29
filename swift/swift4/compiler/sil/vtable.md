## sil_vtable

## vtableとは

[仮想関数テーブル wikipedia](https://ja.wikipedia.org/wiki/%E4%BB%AE%E6%83%B3%E9%96%A2%E6%95%B0%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB)
> 仮想関数テーブル（かそうかんすうテーブル、英: virtual method table）あるいはvtableは、プログラミング言語の実装において動的なポリモーフィズム、すなわち実行時のメソッドの束縛を実現するために用いられる機構である。

ディスパッチテーブルとして、メソッドのアドレスを保持する場所のことを言う。
典型的には、コンパイラは各クラスごとに別の vtable を作成する。

メソッドのアドレスを保持し、動的ディスパッチを可能としている場所を指している。

[仮想関数テーブル wikipedia](https://ja.wikipedia.org/wiki/%E4%BB%AE%E6%83%B3%E9%96%A2%E6%95%B0%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB)
> #### 効率
> 単なるコンパイルされたポインタへのジャンプである非仮想関数の呼び出しに対して、仮想関数の呼び出しは最低一度以上、余分にポインタをたどる操作や"fixup" が必要である。そのため、仮想関数の呼び出しは原理的に非仮想の関数呼び出しに対して低速である。実験によれば 6-13% の実行時間が単なる関数のディスパッチに用いられ、オーバーヘッドは場合によって 50% に達する[1]。
>
> さらに、 JIT コンパイルが使用できない環境では、仮想関数は通常インライン展開できない。テーブルの参照を行う部分を、たとえばインライン化された本体部分を条件文で実行させることも可能ではあるが、そうした最適化は一般的ではない。
>
> オーバーヘッドを避けるため、コンパイラはコンパイル時に呼び出しが解決できる場合には vtable の生成を行わない。
>
> 従って、上記の f1 の呼び出しは、 d が現時点で D のみ保持しており、D が f1 をオーバーライドしないことをコンパイラが判断できるため、vtable の検索は必要なくなる可能性がある。コンパイラ（あるいは最適化プログラム）はプログラム内に f1 をオーバーライドする B1 のサブクラスがないことを検出することができるかもしれない。実装が明示的に指定されているため(this ポインタの fixup が必要ではあるが） B1::f1 ないし B2::f2 はおそらく vtable の検索を必要とすることはない。

## vtable in sil

silにおけるvtableも同様。

```sil
// Define a SIL vtable. This matches dynamically-dispatched method
// identifiers to their implementations for a known static class type.
sil_vtable Button {
  #Button.onClick!1: @_TC5norms6Button7onClickfS0_FT_T_
  #Button.onMouseDown!1: @_TC5norms6Button11onMouseDownfS0_FT_T_
  #Button.onMouseUp!1: @_TC5norms6Button9onMouseUpfS0_FT_T_
}
```


[仮想関数テーブル wikipedia](https://ja.wikipedia.org/wiki/%E4%BB%AE%E6%83%B3%E9%96%A2%E6%95%B0%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB)

[vtableの中身を見てみる](http://sugawarayusuke.hatenablog.com/entry/2018/01/08/185229)

[Swift Intermediate Language (SIL)](https://github.com/apple/swift/blob/master/docs/SIL.rst#id10)

[Javaの自動並列化における例外フローとメソッドディスパッチのインライン化解析 (pdf)](http://www.kasahara.cs.waseda.ac.jp/achieve/pdf/ARC199-9.pdf)
