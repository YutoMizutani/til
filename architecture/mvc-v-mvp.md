## MVC v. MVP

(iOSでいう)VCはMVCだとCだけどMVPだとVって話。

ViewはViewControllerで，
ViewはPresenterのインスタンスを保持しているが，Modelを知らない。
PresenterはModelのインスタンスを保持していて，ViewをProtocolレベルで知っている。
ModelはView用のValue Objectで，ビジネスロジックは持たない。

[iOS Architecture Patterns; Demystifying MVC, MVP, MVVM and VIPER – Medium](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52)
