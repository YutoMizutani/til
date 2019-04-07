## PagingView

```swift
import UIKit

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
        var length: CGFloat = 0
        let targetPosition: CGFloat = isVertical ? position.y : position.x
        let getLength: (UIView) -> CGFloat = { isVertical ? $0.bounds.height : $0.bounds.width }

        for (offset, element) in enumerated() {
            length += getLength(element)
            if targetPosition < length {
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

class PagingView: UIScrollView {
    fileprivate var initialIndex: Int = 0
    var isVertical: Bool = false {
        didSet {
            layoutView()
        }
    }
    var contentViews: [UIView] = [] {
        didSet {
            oldValue.filter { !contentViews.contains($0) }.forEach { $0.removeFromSuperview() }
            contentViews.filter { !oldValue.contains($0) }.forEach { self.addSubview($0) }
            layoutView()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience required init(_ views: [UIView], index: Int = 0, frame: CGRect = .zero, isVertical: Bool) {
        self.init(frame: frame)
        self.contentViews = views
        self.isVertical = isVertical
        self.initialIndex = index
        configureView()
        layoutView()
        configurePosition()
    }

    convenience required init(_ views: UIView..., index: Int = 0, frame: CGRect = .zero, isVertical: Bool) {
        self.init(frame: frame)
        self.contentViews = views
        self.isVertical = isVertical
        self.initialIndex = index
        configureView()
        layoutView()
        configurePosition()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layoutView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutView()
        layoutIfNeeded()
    }

    /// Configure views
    private func configureView() {
        contentInsetAdjustmentBehavior = .never
        showsVerticalScrollIndicator = false
        bounces = false
        isPagingEnabled = true
        contentViews.forEach { self.addSubview($0) }
    }

    /// Configure position
    private func configurePosition() {
        if let initialOrigin = contentViews.origin(initialIndex, isVertical: isVertical) {
            contentOffset = initialOrigin
        }
    }

    /// Layout views
    private func layoutView() {
        contentViews.configurePosition(isVertical)
        contentSize = contentViews.contentSize(isVertical, frame: frame)
    }

    func updatePage(_ index: Int) {
        guard let origin = contentViews.origin(index, isVertical: isVertical) else { return }
        setContentOffset(origin, animated: true)
    }
}

#if canImport(RxSwift) && canImport(RxCocoa)

import RxCocoa
import RxSwift

extension Reactive where Base: PagingView {
    var page: ControlProperty<Int> {
        let source: Observable<Int> = Observable.deferred { [weak pagingView = self.base] in
            let pageChanged: Observable<Int> = Observable.merge(pagingView?.rx.didEndDragging.filter { !$0 }.mapToVoid() ?? Observable.empty(),
                                                                pagingView?.rx.didEndDecelerating.mapToVoid() ?? Observable.empty())
                .filter { [weak self = self.base] in self != nil }
                .map { [unowned self = self.base] in self.contentViews.page(self.contentOffset, isVertical: self.isVertical) }

            return pageChanged
                .startWith(pagingView?.initialIndex ?? 0)
        }

        let bindingObserver = Binder(base) { (pagingView, index: Int) in
            pagingView.updatePage(index)
        }

        return ControlProperty(values: source, valueSink: bindingObserver)
    }
}

#endif
```

[[iPhone] 大きい画像を UIScrollView でスクロールする](https://i-app-tec.com/ios/uiscrollview.html)
