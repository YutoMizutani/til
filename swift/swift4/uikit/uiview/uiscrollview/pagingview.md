## PagingView

```swift
class PagingView: UIScrollView {
    fileprivate var initialPage: Int = 0
    private var disposeBag = DisposeBag()

    /// 最後にタッチされた位置
    var lastTouchedLocation: CGPoint? = nil {
        didSet {
            guard let location = lastTouchedLocation else { return }
            rxLastTouchedLocation.accept(location)
        }
    }
    fileprivate var rxLastTouchedLocation: PublishRelay<CGPoint> = PublishRelay()

    /// 現在のページ
    lazy var page: Int = initialPage
    fileprivate var rxPage: ControlProperty<Int> {
        let source: Observable<Int> = Observable.deferred { [weak pagingView = self] in
            guard let pagingView = pagingView else { return Observable.empty() }
            let pageChanged: Observable<Int> = Observable.merge(
                pagingView.rx.didEndDragging.filter { !$0 }.mapToVoid(),
                pagingView.rx.didEndDecelerating.asObservable(),
                pagingView.rx.didEndScrollingAnimation.asObservable())
                .filter { [weak self] in self != nil }
                .map { [unowned self] in self.contentViews.page(self.contentOffset, isVertical: self.isVertical) }

            return pageChanged
                .startWith(pagingView.initialPage)
        }

        let bindingObserver = Binder(self) { (pagingView, page: Int) in
            pagingView.updatePage(page)
        }

        return ControlProperty(values: source, valueSink: bindingObserver)
    }

    var isVertical: Bool = false {
        didSet {
            layoutView()
        }
    }
    var contentViews: [UIView] = [] {
        didSet {
            oldValue.filter { !contentViews.contains($0) }.forEach { $0.removeFromSuperview() }
            contentViews.forEach { self.addSubview($0) }
            layoutView()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        lastTouchedLocation = touches.first?.location(in: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience required init(_ views: [UIView], page: Int = 0, frame: CGRect = .zero, isVertical: Bool) {
        self.init(frame: frame)
        self.contentViews = views
        self.isVertical = isVertical
        self.initialPage = page
        configureView()
        layoutView()
        configurePosition()
        binding()
    }

    convenience required init(_ views: UIView..., page: Int = 0, frame: CGRect = .zero, isVertical: Bool) {
        self.init(frame: frame)
        self.contentViews = views
        self.isVertical = isVertical
        self.initialPage = page
        configureView()
        layoutView()
        configurePosition()
        binding()
    }

    /// Configure views
    private func configureView() {
        if #available(iOS 11.0, *) {
            contentInsetAdjustmentBehavior = .never
        }
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        bounces = false
        isPagingEnabled = true
        backgroundColor = .clear
        contentViews.forEach { self.addSubview($0) }
    }

    /// Configure position
    private func configurePosition() {
        if let initialOrigin = contentViews.origin(initialPage, isVertical: isVertical) {
            contentOffset = initialOrigin
        }
    }

    private func binding() {
        rx.page.subscribe(onNext: { [weak self] in
            self?.page = $0
        })
            .disposed(by: disposeBag)
    }

    /// Layout views
    private func layoutView() {
        contentViews.configurePosition(isVertical)
        contentSize = contentViews.contentSize(isVertical, frame: frame)
    }

    func updatePage(_ page: Int, animated: Bool = true) {
        guard let origin = contentViews.origin(page, isVertical: isVertical) else { return }
        setContentOffset(origin, animated: animated)
    }

    func updatePage(_ page: Int, animated: Bool = true, completion: @escaping ((Bool) -> Void) = { _ in }) {
        guard let origin = contentViews.origin(page, isVertical: isVertical) else {
            completion(false)
            return
        }
        UIView.animate(
            withDuration: animated ? 0.3 : 0,
            animations: {
                self.setContentOffset(origin, animated: false)
            },
            completion: { finished in
                completion(finished)
            }
        )
    }
}

private extension Array where Element: UIView {
    /// それぞれの方向に対して積み上げた形の位置を取得する
    func origin(_ index: Int, isVertical: Bool) -> CGPoint? {
        guard self.count > index else { return nil }
        if isVertical {
            return CGPoint(x: 0, y: prefix(upTo: index).map { $0.bounds.height }.reduce(0) { $0 + $1 })
        } else {
            return CGPoint(x: prefix(upTo: index).map { $0.bounds.width }.reduce(0) { $0 + $1 }, y: 0)
        }
    }

    /// 現在のページ数を算出する
    func page(_ position: CGPoint, isVertical: Bool) -> Int {
        guard !isEmpty else { return 0 }
        let targetPosition: CGFloat = isVertical ? position.y : position.x
        for (offset, element) in enumerated() {
            if targetPosition == floor(isVertical ? element.frame.minY : element.frame.minX) {
                return offset
            }
        }

        return count - 1
    }

    /// それぞれの方向に対して積み上げる形で位置を調整する
    func configurePosition(_ isVertical: Bool) {
        self.enumerated().forEach {
            $0.element.frame.origin = origin($0.offset, isVertical: isVertical)!
        }
    }

    /// それぞれの方向に対して積み上げる形で ScrollView の領域を計算する
    func contentSize(_ isVertical: Bool, frame: CGRect? = nil) -> CGSize {
        if isVertical {
            return CGSize(width: isEmpty ? 0 : frame?.width ?? self[0].bounds.width, height: map { $0.bounds.height }.reduce(0) { $0 + $1 })
        } else {
            return CGSize(width: map { $0.bounds.width }.reduce(0) { $0 + $1 }, height: isEmpty ? 0 : frame?.height ?? self[0].bounds.height)
        }
    }
}

#if canImport(RxSwift) && canImport(RxCocoa)

extension Reactive where Base: PagingView {
    /// 最後にタッチされた位置
    var lastTouchedLocation: PublishRelay<CGPoint> {
        return base.rxLastTouchedLocation
    }

    /// 現在のページ
    var page: ControlProperty<Int> {
        return base.rxPage
    }
}

#endif
```

[[iPhone] 大きい画像を UIScrollView でスクロールする](https://i-app-tec.com/ios/uiscrollview.html)
