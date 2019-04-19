## Remove audio from a video file

```swift
//
//  VideoUltilities.swift
//
//  Created by Le Ngoc Giang on 4/13/16.
//  Copyright © 2016 gianglengoc. All rights reserved.
//
import Foundation
import AVFoundation
import AssetsLibrary
import UIKit

class VideoUltilities: NSObject {

  static let sharedInstance = VideoUltilities()

  // MARK: Public methods

  func cropVideo(url: NSURL, completion: (NSURL?, NSError?) -> Void) -> Void {

    let outputURL = url

    let fileManager = NSFileManager.defaultManager()

    let asset : AVURLAsset = AVURLAsset(URL: outputURL, options: nil)

    if let clipVideoTrack: AVAssetTrack = asset.tracksWithMediaType(AVMediaTypeVideo)[0] {

      if clipVideoTrack.naturalSize.height == clipVideoTrack.naturalSize.width {
        let stringURL = outputURL.absoluteString.stringByReplacingOccurrencesOfString("file://", withString: "")
        completion(NSURL(string: stringURL), nil)
        return
      }

      let videoComposition: AVMutableVideoComposition = AVMutableVideoComposition()

      videoComposition.frameDuration = CMTimeMake(1, 30)

      let squareSize =  clipVideoTrack.naturalSize.height > clipVideoTrack.naturalSize.width ? clipVideoTrack.naturalSize.width : clipVideoTrack.naturalSize.height

      videoComposition.renderSize = CGSizeMake(squareSize,squareSize)

      let instruction: AVMutableVideoCompositionInstruction = AVMutableVideoCompositionInstruction()
      instruction.timeRange = CMTimeRangeMake(kCMTimeZero,  CMTimeMakeWithSeconds(60, 30))

      let transformer: AVMutableVideoCompositionLayerInstruction =
        AVMutableVideoCompositionLayerInstruction(assetTrack: clipVideoTrack)

      let t1: CGAffineTransform = CGAffineTransformMakeTranslation(clipVideoTrack.naturalSize.height, -(clipVideoTrack.naturalSize.width - clipVideoTrack.naturalSize.height) / 2 )

      let t2: CGAffineTransform = CGAffineTransformRotate(t1, CGFloat(M_PI_2))

      let finalTransform: CGAffineTransform = t2

      transformer.setTransform(finalTransform, atTime: kCMTimeZero)
      instruction.layerInstructions = [transformer]

      videoComposition.instructions = [instruction]

      let exportPath : NSString = NSString(format: "%@%@", NSTemporaryDirectory(), "output2.mov")

      let exportUrl: NSURL = NSURL.fileURLWithPath(exportPath as String)

      if(fileManager.fileExistsAtPath(exportPath as String)) {

        try! fileManager.removeItemAtURL(exportUrl)
      }

      let exporter = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality)
      exporter!.videoComposition = videoComposition
      exporter!.outputFileType = AVFileTypeQuickTimeMovie
      exporter!.outputURL = exportUrl
      exporter!.exportAsynchronouslyWithCompletionHandler({ () -> Void in

        print(CMTimeGetSeconds((exporter?.asset.duration)!))

        switch exporter!.status {
        case .Completed :
          let URL = NSURL(string: exportPath as String)
          completion(URL, nil)

        default:
          print(exporter?.error)
          completion(nil, exporter?.error)
        }
      })
    }
  }

  func trimVideov2(sourceURL: NSURL, startTime: CMTime, endTime: CMTime, withAudio: Bool, completion:(NSURL?, NSError?) -> Void) -> Void {

    let fileManager = NSFileManager.defaultManager()

    let sourcePathURL = NSURL(fileURLWithPath: (sourceURL.absoluteString))

    let asset = AVURLAsset(URL: sourcePathURL)

    let composition = AVMutableComposition()

    let videoCompTrack = composition.addMutableTrackWithMediaType(AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
    let audioCompTrack = composition.addMutableTrackWithMediaType(AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)

    let assetVideoTrack = asset.tracksWithMediaType(AVMediaTypeVideo)[0]
    let assetAudioTrack = asset.tracksWithMediaType(AVMediaTypeAudio)[0]

    var accumulatedTime = kCMTimeZero

    let durationOfCurrentSlice = CMTimeSubtract(endTime, startTime)
    let timeRangeForCurrentSlice = CMTimeRangeMake(startTime, durationOfCurrentSlice)

    do {
      try videoCompTrack.insertTimeRange(timeRangeForCurrentSlice, ofTrack: assetVideoTrack, atTime: accumulatedTime)
      try audioCompTrack.insertTimeRange(timeRangeForCurrentSlice, ofTrack: assetAudioTrack, atTime: accumulatedTime)
    }
    catch let error {
      print("Error insert time range \(error)")
    }

    accumulatedTime = CMTimeAdd(accumulatedTime, durationOfCurrentSlice)

    print("Trimv2 \(CMTimeGetSeconds(accumulatedTime))")

    let destinationPath = String(format: "%@%@", NSTemporaryDirectory(),"trim.mp4")
    let destinationPathURL = NSURL(fileURLWithPath: destinationPath)

    if fileManager.fileExistsAtPath(destinationPath) {
      // remove if exists
      do {
        try fileManager.removeItemAtURL(destinationPathURL)
      }
      catch let error {
        print("Could not remove file at path \(destinationPath) with error \(error)")
      }
    }

    let exportSession = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality)
    exportSession?.outputURL = destinationPathURL
    exportSession?.outputFileType = AVFileTypeMPEG4
    exportSession?.shouldOptimizeForNetworkUse = true

    exportSession?.exportAsynchronouslyWithCompletionHandler({
      switch exportSession!.status {
      case .Completed :
        completion(NSURL(string: destinationPath),nil)
      default :
        print("Error export")
      }
    })

  }

  func removeAudioFromVideo(videoURL: NSURL, completion: (NSURL?, NSError?) -> Void) -> Void {

    let fileManager = NSFileManager.defaultManager()

    let composition = AVMutableComposition()

    let sourceAsset = AVURLAsset(URL: videoURL)

    let compositionVideoTrack = composition.addMutableTrackWithMediaType(AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)

    let sourceVideoTrack: AVAssetTrack = sourceAsset.tracksWithMediaType(AVMediaTypeVideo)[0]

      let x = CMTimeRangeMake(kCMTimeZero, sourceAsset.duration)

      try! compositionVideoTrack.insertTimeRange(x, ofTrack: sourceVideoTrack, atTime: kCMTimeZero)

      let exportPath : NSString = NSString(format: "%@%@", NSTemporaryDirectory(), "removeAudio.mov")

      let exportUrl: NSURL = NSURL.fileURLWithPath(exportPath as String)

      if(fileManager.fileExistsAtPath(exportPath as String)) {

        try! fileManager.removeItemAtURL(exportUrl)
      }

      let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality)
      exporter!.outputURL = exportUrl;
      exporter!.outputFileType = AVFileTypeQuickTimeMovie

      exporter?.exportAsynchronouslyWithCompletionHandler({
        dispatch_async(dispatch_get_main_queue(), {

          completion(exporter?.outputURL, nil)
        })

      })
  }

  func generateThumbnailsForVideoWithURL(url: NSURL) -> NSMutableArray {

    let asset = AVURLAsset(URL: NSURL(fileURLWithPath: url.absoluteString))

    let assetDuration = CMTimeGetSeconds(asset.duration)

    let generate = AVAssetImageGenerator(asset: asset)

    let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo) as! [AVCaptureDevice]

    let captureDevice: AVCaptureDevice = devices.first!

    generate.appliesPreferredTrackTransform = true

    let timescale = captureDevice.activeVideoMaxFrameDuration.timescale

    let thumbnailArray = NSMutableArray()

    for frameNumber in 0...2 {

      let time = CMTime(value: Int64(frameNumber * Int(assetDuration)), timescale: timescale)

      do {

        let imgRef = try generate.copyCGImageAtTime(time, actualTime: nil)

        let image = UIImage(CGImage: imgRef)

        thumbnailArray.addObject(image)
      }
      catch let e {
        print("generate image error \(e)")
      }
    }
    return thumbnailArray
  }

  func mergeAudioToVideo(souceAudioPath: String, souceVideoPath: String, completion:(NSURL?, NSError?) -> Void) -> Void {

    let fileManager = NSFileManager.defaultManager()

    let composition = AVMutableComposition()

    let videoAsset = AVURLAsset(URL: NSURL(fileURLWithPath: souceVideoPath))

    let audioAsset = AVURLAsset(URL: NSURL(fileURLWithPath: souceAudioPath))

    let audioTrack = composition.addMutableTrackWithMediaType(AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)

    try! audioTrack.insertTimeRange(CMTimeRangeMake(kCMTimeZero, videoAsset.duration), ofTrack: audioAsset.tracksWithMediaType(AVMediaTypeAudio)[0], atTime: kCMTimeZero)

    let composedTrack = composition.addMutableTrackWithMediaType(AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)

    try! composedTrack.insertTimeRange(CMTimeRangeMake(kCMTimeZero, videoAsset.duration), ofTrack: videoAsset.tracksWithMediaType(AVMediaTypeVideo)[0], atTime: kCMTimeZero)

    let exportPath : NSString = NSString(format: "%@%@", NSTemporaryDirectory(), "mergeVideo.mov")

    let exportUrl: NSURL = NSURL.fileURLWithPath(exportPath as String)

    if(fileManager.fileExistsAtPath(exportPath as String)) {

      try! fileManager.removeItemAtURL(exportUrl)
    }

    let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality)

    exporter!.outputURL = exportUrl

    exporter!.outputFileType = AVFileTypeQuickTimeMovie

    exporter?.exportAsynchronouslyWithCompletionHandler({

      dispatch_async(dispatch_get_main_queue(), {

        let stringURL = exportUrl.absoluteString.stringByReplacingOccurrencesOfString("file://", withString: "")

        let URL = NSURL(string: stringURL)

        completion(URL, nil)
      })
    })
  }

  func removeVideoWithPath(videoPath: String) -> Bool {

    let fileManager = NSFileManager.defaultManager()

    if fileManager.fileExistsAtPath(videoPath) {
      do {
       try fileManager.removeItemAtURL(NSURL(string: videoPath)!)
        return true
      }
      catch let error {
        print("Could not remove video with path \(videoPath) error \(error)")
      }
    }
    return false
  }

  func getDurationFromFilePath(sourcePath: String) -> Float64 {

    let asset = AVURLAsset(URL: NSURL(fileURLWithPath: sourcePath))

    let fileDuration = asset.duration

    return CMTimeGetSeconds(fileDuration)

  }

}
```

```swift
var initPath1 = VideoLocalPath
var composition = AVMutableComposition.composition()
var inputVideoPath = initPath1
var sourceAsset = AVURLAsset(URL: URL(fileURLWithPath: inputVideoPath), options: nil)
var compositionVideoTrack = composition.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
var ok = false
var sourceVideoTrack = sourceAsset.tracks(withMediaType: AVMediaTypeVideo)[0]
var x = CMTimeRangeMake(kCMTimeZero, sourceAsset.duration)
do {
    ok = try compositionVideoTrack.insertTimeRange(x, of: sourceVideoTrack, atTime: kCMTimeZero)
}
catch let error {
}
if FileManager.default.fileExists(atPath: initPath1) {
    do {
        try FileManager.default.removeItem(at: initPath1)
    }
    catch let error {
    }
}
var url = URL(fileURLWithPath: initPath1)
var exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality)
exporter.outputURL = url


func savefinalVideoFile(toDocuments url: URL) {
    var storePath = NSURL(fileURLWithPath: self.applicationCacheDirectory()).appendingPathComponent("Videos")!.absoluteString
    var movieData = Data(contentsOf: url)
    movieData.write(toFile: storePath, atomically: true)
}

func applicationCacheDirectory() -> String {
    var paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
    var documentsDirectory = (paths.count > 0) ? paths[0] : nil
    return documentsDirectory
}
```

[lengocgiang/VideoUltilities.swift](https://gist.github.com/lengocgiang/968a01ef98deb4eaeee70daed54fee35)
[Remove audio from a video file](https://stackoverflow.com/questions/40194128/remove-audio-from-a-video-file/40194245)
[Is it possible to edit the volume and pan of a video's audio-track and export to a stand-alone video with that information?](https://stackoverflow.com/questions/21816215/is-it-possible-to-edit-the-volume-and-pan-of-a-videos-audio-track-and-export-to)
[Trim audio with iOS](https://stackoverflow.com/questions/4238219/trim-audio-with-ios)
[Adding silence to the end of a recorded audio file](https://stackoverflow.com/questions/10252032/adding-silence-to-the-end-of-a-recorded-audio-file)
