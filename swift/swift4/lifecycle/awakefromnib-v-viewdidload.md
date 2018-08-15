## awakeFromNib v. viewDidLoad

[Which should I use, -awakeFromNib or -viewDidLoad?](https://stackoverflow.com/questions/377202/which-should-i-use-awakefromnib-or-viewdidload)
> I recently had a problem in my app where some of the subviews I was creating in a UIViewController subclass's  -awakeFromNib method were disappearing from the view. After some poking around I found that moving the code I had put in -awakeFromNib to -viewDidLoad solved the problem. Seems that -awakeFromNib gets called only once when the UIViewController is unarchived from the nib, and -viewDidLoad gets called every time the view is unarchived.
> So what's the best practice? It looks like UIViewController's -awakeFromNib shouldn't be adding any views to the view, that kind of stuff should be done in -viewDidLoad. Am I understanding this correctly? Or am I more confused than I thought?
> > Yes, it's correct. You shouldn't really rely on awakeFromNib to do that kind of tasks.
> > awakeFromNib is similar to an event that's called after deserialization in .NET. viewDidLoad is similar to Load event in .NET.
> > If you are familiar with the concepts from .NET, this should be enough, I think.
> > awakeFromNib is called when the controller itself is unarchived from a nib. viewDidLoad is called when the view is created/unarchived. This distinction is especially important when the controller's view is stored in a separate nib file.

[[UIKit]ViewDidLoad は一度しか呼ばれないと思っていました…](http://www.zero4racer.com/blog/650)
> Also important is that the awakeFromNib function will never be called after recovering from memory warning. But, viewDidLoad function will be called.
> AwakeFromNibは、メモリ警告から復帰した時に呼ばれないけど、viewDidLoadFunctionは、呼ばれます。

[UIViewControllerのライフサイクル](https://www.slideshare.net/satoshianai/uiviewcontroller-24426124)
viewDidLoad複数回はiOS5以前?

[[UIKit]ViewDidLoad は一度しか呼ばれないと思っていました…](http://www.zero4racer.com/blog/650)
[Which should I use, -awakeFromNib or -viewDidLoad?](https://stackoverflow.com/questions/377202/which-should-i-use-awakefromnib-or-viewdidload)
[UIViewControllerのライフサイクル](https://www.slideshare.net/satoshianai/uiviewcontroller-24426124)
