## Get lines

var lines: Int {
    guard let text = text, text != "" else { return 0 }
    let oneLineHeight  =  "a".boundingRect(with: self.bounds.size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: self.font], context: nil).height
    let boundingHeight = text.boundingRect(with: self.bounds.size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: self.font], context: nil).height

    return Int(oneLineHeight/boundingHeight)
}

[UILabel の行数を調べる方法](https://dev.classmethod.jp/smartphone/uilabel-line-number/)
