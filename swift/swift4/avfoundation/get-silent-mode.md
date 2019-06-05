[How can I detect whether an iOS device is in silent mode or not?](https://stackoverflow.com/questions/35284722/how-can-i-detect-whether-an-ios-device-is-in-silent-mode-or-not)

try AVAudioSession.sharedInstance().setCategory({AVAudioSessionCategory})
        try AVAudioSession.sharedInstance().setActive(true)
        audioPlayer = try AVAudioPlayer(contentsOfURL: alertSound)
        audioPlayer.prepareToPlay()
        audioPlayer.play()



In the {AVAudioSessionCategory}, you can specify:
AVAudioSessionCategorySoloAmbient: Your audio is silenced by screen locking and by the Silent switch
AVAudioSessionCategoryPlayBack: Your Audio continues with the Silent switch set to silent or when the screen locks
