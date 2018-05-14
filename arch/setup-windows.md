## Setup Archlinux for Windows
1. isoイメージのダウンロード
[日本語Wiki](https://wiki.archlinux.jp/index.php/%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%82%AC%E3%82%A4%E3%83%89)
[ダウンロード](https://www.archlinux.jp/download/)

2. VB作成
  - クリップボードの共有: 双方向
  - ドラッグ & ドロップ: 双方向
  -

2. 起動モードの確認
　- UEFI マザーボードで UEFI モードが有効になっている場合、Archiso は systemd-boot によって Arch Linux を起動します。UEFI 環境ではインストール手順が多少異なります。efivars をチェックして UEFI モードで起動しているかどうか確認してください:
    ```
    # ls /sys/firmware/efi/efivars
    ```



    https://qiita.com/CirocMK2/items/8929a67a3cd7223fb90c
    http://archlinux-blogger.blogspot.jp/2014/11/pacman-arch-linux-pacman.html
    http://note.kurodigi.com/post-0-21/
    https://www.reddit.com/r/archlinux/comments/69r15f/xorgserverutils_removed/
    https://blanktar.jp/blog/2013/02/startx-timeout_in_locking.html
    http://futurismo.biz/archives/2488
    http://cotaro-science.blogspot.jp/2016/02/ttf-ricty.html
    https://kashimiaring.wordpress.com/2017/03/08/arch%E3%82%92%E5%86%8D%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E5%82%99%E5%BF%98%E9%8C%B2/




    注意

    かなり初心者向けに回りくどく､画像も多めに書いてます
    筆者がUSキーボードなのでloadkeys jp106してません
    準備

    VirtualBoxのインストール

    下記リンクよりダウンロードしてインストール
    http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html?ssSourceSiteId=otnjp
    archlinuxのISO

    Index of /Linux/archlinux/isoから最新日付のISOをダウンロードしておく
    手順

    VMの作成

    VirtualBoxの｢新規｣よりVMを作成(名前やメモリーサイズはお好みで)
    仮想ハードディスクを作成する
    VDI(VirtualBox Disk Image)で作成
    可変サイズ(お好みで)
    作成したら｢システム｣より｢EFIを有効化｣にチェック
    ネットワークアダプタが｢NAT｣で有効化されていることを確認
    ｢ストレージ｣から｢コントローラー: IDE｣にダウンロードしたISOをセット
    ｢OK｣を押してVMを起動する
    OSのインストール

    ESP(EFI system partition)の作成

    参考
    EFI システムパーティション - ArchWiki
    GNU Parted - ArchWiki
    EFI system partitionを作成
    parted /dev/sda
    (parted) mklabel gpt
    (parted) mkpart ESP fat32 1MiB 513MiB
    (parted) set 1 boot on
    (parted) mkpart primary ext4 513MiB 100%
    (parted) quit
    ファイルシステムの初期化

    lsblk /dev/sda # sda1がESP､sda2がrootパーティション
    mkfs.vfat -F32 /dev/sda1
    mkfs.ext4 /dev/sda2
    パーティションのマウント

    mount /dev/sda2 /mnt # /mntにrootパーティションをマウント
    mkdir /mnt/boot
    mount /dev/sda1 /mnt/boot # /mnt/bootにESPをマウント
    パッケージのインストール
    loadkeys jp106
    vim /etc/pacman.d/mirrorlist # Japan以外のミラーをコメントアウトする
    - vim 操作
      - http://d.hatena.ne.jp/japanrock_pg/20100628/1277739776
      - 最初はUS配列
        - 全てをコメント
          - +が:の位置
          - gg
          - ctrl v
          - G
          - I
          - # (変わらない)
          - esc
        - Japanのみコメントアウト
          - /Ja
          - Enter
          - i
          - x (#を消す)
          - n
        - 保存
          - :(US配列位置は+の場所にある)wq
    ///////////////////

    http://archlinux-blogger.blogspot.jp/2014/11/pacman-arch-linux-pacman.html
    筑波鯖の追加

    # Score: 1.7, Japan
    Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch
    # Score: 20.3, Japan
    Server = http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/$repo/os/$arch

    //////////////////
    pacstrap /mnt base
    初期設定

    genfstab -p /mnt >> /mnt/etc/fstab
    arch-chroot /mnt
    ///////////////////////////////////////
    echo archlinux > /etc/hostname
    ///////////////////////////////////////
    ln -sf /usr/share/zoneinfo/Japan /etc/localtime
    vi /etc/locale.gen # en_US.UTF-8の行のコメントを外す
    /////////////////////////////////////
    (dl で1字切り取り)
    en_US.UTF-8 UTF-8
    ja_JP.UTF-8 UTF-8
    /////////////////////////////////////
    locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    mkinitcpio -p linux
    passwd # vagrantに設定
    GRUBのインストール

    参考
    GRUB インストール - ArchWiki
    pacman -S grub efibootmgr
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck
    エントリのコピー

    参考
    GRUB UEFI ファームウェアの応急処置 - ArchWiki
    mkdir /boot/EFI/boot
    cp /boot/EFI/arch_grub/grubx64.efi /boot/EFI/boot/bootx64.efi
    grub-mkconfig -o /boot/grub/grub.cfg


    exit
    umount -R /mnt
    shutdown -r now
    OSの設定

    ログイン

    [hostname] login: root
    Password: 設定したパスワード
    dhcpcd.serviceの有効化

    dhcpcd.serviceを有効にしてインターネットに接続出来るようにする
    systemctl enable dhcpcd.service
    systemctl start dhcpcd.service
    ユーザーの作成

    useradd -m [username]
    passwd [username] # パスワード設定
    sudo の設定

    loadkeys jp106
    pacman -S sudo
    visudo
    以下を追記
    [username] ALL=(ALL) ALL
    vim,wget,git,curlのインストール

    pacman -S vim wget git curl
    yaourtのインストール

    リポジトリの追加

    vim /etc/pacman.conf
    以下を追記
    [archlinuxfr]
    SigLevel = Never
    Server = http://repo.archlinux.fr/$arch
    以下のコメントアウトを外す
    [multilib]
    Include = /etc/pacman.d/mirrorlist
    リフレッシュ
    pacman --sync --refresh yaourt
    pacman -Syu
    yaourtのインストール
    pacman -S yaourt
    zshのインストール

    pacman -S zsh
    chsh
    > /bin/zsh
    su - [username]
    $ chsh
    > /bin/zsh
    $ vim ~/.zshrc
    # 色を有効
    autoload -Uz colors
    colors

    # 補完機能
    autoload -Uz compinit
    compinit

    # ヒストリ
    HISTFILE=~/.zsh_history
    HISTSIZE=10000
    SAVEHIST=10000

    # 日本語ファイル名を表示可能にする
    setopt print_eight_bit

    # プロンプトを2行表示にする
    PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
    %# "

    ///////////////////////////////////
    http://note.kurodigi.com/post-0-21/
    コンソールフォントとキーマップ新システム用の設定
    新システムでのキーボードレイアウトとフォントを設定しましょう。
    # loadkeys jp106
    # setfont Lat2-Terminus16
    再起動後もキーマップ設定を持続させるために、vconsole.conf を作成
    # vim /etc/vconsole.conf
    以下を記載し保存する。
    KEYMAP=jp106
    FONT=Lat2-Terminus16
    ////////////////////////////////////

    デスクトップ環境

    ここからが本題です｡
    Xのインストール

    まずは裸の状態のLinuxのデスクトップ環境を立ち上げてみましょう
    参考
    Xorg - ArchWiki
    今回はVirtualBoxを使っているのでグラフィックドライバを考えなくて良い分､実際のPCにインストールするよりは楽でしょう｡
    まずは必要なXorgのパッケージ群をインストールします｡
    $ zsh
    % sudo pacman -S xorg-server xorg-server-utils xorg-xinit xorg-xclock xterm # グラフィックについて問われるがdefaultでOK
    /////////////////////////////////
    https://www.reddit.com/r/archlinux/comments/69r15f/xorgserverutils_removed/
    % sudo pacman -Rns xorg-server-utils
    % sudo pacman -S xorg-apps
    //////////////////////////////////

    //////////////////////////////////////////
    https://blanktar.jp/blog/2013/02/startx-timeout_in_locking.html

    $ rm .Xauthority-*
    $ :> .Xauthority
    $ chmod 600 .Xauthority
    //////////////////////////////////////////


    試しに立ち上げます
    % sudo startx
    image
    ターミナルが3つ立ち上がり､右上に時計があるだけのデスクトップ環境が立ち上がりました｡
    とはいえ､これで最低限のデスクトップ環境は完成しましたので再起動してみます｡
    どのウィンドウでも良いのでsudo shutdown -r nowしてみてください｡
    すると､結局もとのコンソールが開いただけであまり変わり映えしないですね｡
    毎回startxすればデスクトップ環境が立ち上がるので､コレで終わりです｡
    と言いたいところですが､このままでは怒られそうなので､挙動を見ながら少しずつ環境整備していきます｡
    まずは自動でデスクトップ環境が立ち上がるようにします｡
    % vim ~/.zprofile
    # ~/.zprofile
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
    bashの方は~/.bash_profileに記述
    sudo reboot or sudo shutdown -r nowで再起動
    ログイン時に~/.zprofileが読み込まれる為､ログインした際に自動でxのデスクトップ環境が立ち上がるはずです｡
    まだ､あまり劇的に変化した感じはしないですね｡
    このまま次の作業に移っても良いのですが､Xのデスクトップのターミナルはスクロールがうまくいかず､使いにくいので､再度開いて下記のようにコメントアウトして再起動しておくことをオススメします｡
    # [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
    デスクトップ環境Xfceのインストール

    もう少しまともな見た目にしましょう
    GNOMEなど様々なデスクトップ環境が存在していますが､今回は比較的軽量なXfceをインストールします｡
    参考
    Xfce - ArchWiki
    % sudo pacman -S xfce4 # 全てEnterでOK
    % vim ~/.xinitrc # 自動でxfceが立ち上がるようにstartx時に動くスクリプトを記述
    ~/.xinitrc
    exec startxfce

    Xfceを立ち上げてみましょう
    % startx # 少し時間がかかりますが､待ちます
    フォントが微妙ですが､さっきよりはPCらしくなったのでは無いでしょうか?
    VirtualBox_Arch_09_04_2017_18_59_56.png
    Use default configを選択します｡
    VirtualBox_Arch_09_04_2017_19_10_15.png
    One empty panelを選択すると上下のパネルもランチャーも無いので､初めてXfceを使う人はやめた方がいいと思います｡
    既にお気づきの方もいるかと思いますが､ここでコメントアウトしていた~/.zprofileのコメントアウトを外すと｢ログイン時zprofileを読み込み自動でXが起動｣ > ｢X起動時にxinitrcが読み込まれXfceが起動｣されます｡
    ランチャーにあるターミナルのアイコンをクリックしてターミナルを開き､コメントアウトを外しましょう｡
    # ~/.zprofile
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
    再起動してみます｡
    % sudo reboot
    ログインすると自動でXfceが開いたのを確認できたかと思います｡
    ディスプレイマネージャ(LightDM)のインストール

    ここまで来るとログイン画面ももう少し整えたいところ
    参考
    LightDM - ArchWiki
    % sudo pacman -S lightdm lightdm-gtk-greeter
    % sudo systemctl enable lightdm.service # lightdmの自動起動
    % sudo reboot # 再起動
    WindowsやMacで見慣れているようなログイン画面が出てきました｡
    VirtualBox_Arch_09_04_2017_19_32_20.png
    なお､ディスプレイマネージャが起動時にまず読み込まれ､その後デスクトップ環境を立ち上げるところまでやってくれるので､zprofileとxinitrcはお役御免となります｡
    % rm ~/.zprofile ~/.xinitrc
    % sudo reboot
    如何でしょうか?
    削除してもちゃんとLightDMが起動し､ログインするとXfceが立ち上がるはずです｡
    VirtualBox Guest Additionsをインストール

    参考
    VirtualBox Guest Additions- ArchWiki
    解像度をVirtualBoxのウィンドウサイズに合わせて変更したり､フルスクリーンを有効にするため､Guest Additionsをインストールします｡
    % sudo pacman -S virtualbox-guest-utils #Enter a number (default=1): 2
    VirtualBoxカーネルモジュールのロード
    $ sudo modprobe -a vboxguest vboxsf vboxvideo
    $ sudo vim /etc/modules-load.d/virtualbox.conf
    # /etc/modules-load.d/virtualbox.conf
    vboxguest
    vboxsf
    vboxvideo
    /////////////////////
    % sudo systemctl enable vboxservice.service
    /////////////////////
    % sudo reboot
    これでウィンドウサイズに合わせてゲストの解像度が勝手に変わってくれます｡
    今回は終わりです

    ///////////////////////////
    http://futurismo.biz/archives/2488
    http://cotaro-science.blogspot.jp/2016/02/ttf-ricty.html
    https://kashimiaring.wordpress.com/2017/03/08/arch%E3%82%92%E5%86%8D%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E5%82%99%E5%BF%98%E9%8C%B2/

    Ricty font
    sudo pacman -Syy
    sudo pacman -S
    yaourt -Syu
    yaourt -S base-devel
    yaourt -S ttf-ricty
    ///////////////////////////////

    http://note.kurodigi.com/archlinux-vbox-share/
    共有フォルダ
    % sudo systemctl enable vboxservice.service


    /////////////////
    mkdir /Downloads/
    ////////////////

    ///////
    http://cotaro-science.blogspot.jp/2016/02/mozc.html
    http://mofoolog.hateblo.jp/entry/archlinux-cinnamon-gdm-setting-1602#Ricty-Diminished%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB
    //////

    /////////////
    create trash
    http://note.kurodigi.com/archlinux-xfce-trash/

    $ sudo pacman -S gvfs
    /////////////

    /////////////////
     yaourt -S codeblocks
    /////////////////

    http://nandenogori.blogspot.jp/2015/07/xorg.html
    xfce4の日本語キーボード認識
    /etc/X11/xorg.conf.d/ 以下に、新規ファイル 10-keyboard.conf を作成する。
    $ vim /etc/X11/xorg.conf.d/10-keyboard.conf
    新たに作成したファイルに、以下を入力する。
    Section "InputClass"
            Identifier "system-keyboard"
            MatchIsKeyboard "on"
            Option "XkbLayout" "jp,us"
            Option "XkbModel" "jp106"
            Option "XkbVariant" ",dvorak"
            Option "XkbOptions" "grp:alt_shift_toggle"
    EndSection

# いろいろ
sudo pacman -S chromium vim
