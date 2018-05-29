## function_ref

[LLVM Programmer’s Manual](http://llvm.org/docs/ProgrammersManual.html#id35)
> #### The function_ref class template
> The function_ref (doxygen) class template represents a reference to a callable object, templated over the type of the callable. This is a good choice for passing a callback to a function, if you don’t need to hold onto the callback after the function returns. In this way, function_ref is to std::function as StringRef is to std::string.
>
> function_ref<Ret(Param1, Param2, ...)> can be implicitly constructed from any callable object that can be called with arguments of type Param1, Param2, …, and returns a value that can be converted to type Ret. For example:
>
> void visitBasicBlocks(Function *F, function_ref<bool (BasicBlock*)> Callback) {
>   for (BasicBlock &BB : *F)
>     if (Callback(&BB))
>       return;
> }
> can be called using:
>
> visitBasicBlocks(F, [&](BasicBlock *BB) {
>   if (process(BB))
>     return isEmpty(BB);
>   return false;
> });
> Note that a function_ref object contains pointers to external memory, so it is not generally safe to store an instance of the class (unless you know that the external storage will not be freed). If you need this ability, consider using std::function. function_ref is small enough that it should always be passed by value.


[LLVM Programmer’s Manual](http://llvm.org/docs/ProgrammersManual.html#id35)
