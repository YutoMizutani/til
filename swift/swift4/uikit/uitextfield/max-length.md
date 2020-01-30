## Maxmun length in UITextField

```swift
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField! // Link this to a UITextField in Storyboard

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        textField.delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
}
```

[Max length UITextField](https://stackoverflow.com/a/25224331)
