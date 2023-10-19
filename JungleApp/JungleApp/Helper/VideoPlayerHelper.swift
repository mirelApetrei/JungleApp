//
//  VideoPlayerHelper.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 19.10.23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

// MARK: - Methods -> playVideo
func playVideo(fileName: String, fileFormat: String) -> AVPlayer{
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil{
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
