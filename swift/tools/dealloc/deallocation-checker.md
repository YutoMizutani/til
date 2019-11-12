## DeallocationChecker

https://github.com/fastred/DeallocationChecker/blob/master/README.md
> ## Usage
>
> First, enable the library by calling (for example from your application delegate):
>
> ```swift
> #if DEBUG
>     DeallocationChecker.shared.setup(with: .alert) // There are other options than > .alert too!
> #endif
> ```
>
> Then, in your view controllers **from within `viewDidDisappear(_:) override`**, call:
>
> ```swift
> override func viewDidDisappear(_ animated: Bool) {
>     super.viewDidDisappear(animated)
>
>     DeallocationChecker.shared.checkDeallocation(of: self)
> }
> ```
>
> If a view controller isn’t deallocated after disappearing for good, you'll see a helpful alert

[fastred/DeallocationChecker](https://github.com/fastred/DeallocationChecker)
