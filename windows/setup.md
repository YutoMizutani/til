## Setup Windows10

Windows10 環境設定
インストール後

・Google日本語入力のダウンロード，インストール
    https://www.google.co.jp/ime/

・VNCのインストール
    ・Ultra Vnc
        http://www.uvnc.com/
        ダウンロード，インストール。

・Google Chromeのインストール

・Bash on Ubuntu on Windows
    https://qiita.com/Aruneko/items/c79810b0b015bebf30bb
    ・Windows Insider Programに同意（無料）
        https://insider.windows.com/ja-jp/welcome-insider/

    ・Insider Preview ビルドの入手
        スタートメニュー -> 設定 -> 更新とセキュリティ -> Windows Update -> 詳細オプション -> Insider Preview ビルドの入手
            [開始する]
            再起動
    ・Windows Subsystem for Linux (Beta)の有効化
        スタート右クリック -> プログラムと機能 -> Windows の機能の有効化または無効化
        Windows Subsystem for Linux (Beta)にチェック
        再起動
    ・開発者モードの有効化
        スタートメニュー -> 設定」-> 更新とセキュリティ -> 開発者向け -> 開発者向け機能を使う
        開発者モードを選択
        はい
    ・Bashのインストール
        コマンドプロンプトを起動
        >bash
        >y


・Perl環境構築
    http://perl-users.jp/articles/advent-calendar/2010/win32/1
    ・Strawberry Perlのインストール
        http://strawberryperl.com/
    ・Pathを通す
        https://www.ginnokagi.com/2014/12/activeperlstrawberry-perl.html
        スタート右クリック -> システム -> バージョン情報 -> システム情報 -> システムの詳細設定 -> 環境変数
        システム環境変数 -> Path に "C:\Strawberry\perl\bin"および"C:\Strawberry\c\bin"が含まれているか確認
        含まれていなければ，「;」で区切りつつ追記する。

・Ruby環境構築
    ・RubyInstallerのダウンロード
        https://rubyinstaller.org/downloads/
        上記リンクより，.exeファイルをダウンロード。
        https://rubyinstaller.org/downloads/
