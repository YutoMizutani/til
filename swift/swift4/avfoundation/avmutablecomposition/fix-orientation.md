## Fix orientation

> If all you want is preserve you video orientation you may want to assign AVMutableCompositionTrack prefferedTransition value from AVAssetTrack like this:

```objc
AVAssetTrack *videoAssetTrack= [[videoAsset tracksWithMediaType:AVMediaTypeVideo] lastObject];

AVMutableCompositionTrack *videoCompositionTrack = [composition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
[videoCompositionTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, videoAsset.duration) ofTrack:videoAssetTrack atTime:kCMTimeZero error:&error];

videoCompositionTrack.preferredTransform = videoAssetTrack.preferredTransform;
```

[how to control orientation of video assembled with AVMutableComposition](https://stackoverflow.com/questions/4175060/how-to-control-orientation-of-video-assembled-with-avmutablecomposition)
