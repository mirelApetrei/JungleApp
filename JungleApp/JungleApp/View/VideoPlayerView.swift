//
//  VideoPlayerView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 19.10.23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {

    // MARK: - Properties
    var videoSelected: String
    var videoTitle: String

    // MARK: - Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                //Text(videoTitle)
            } //: VideoPlayer
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            ) //: Overlay
        } //: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

#Preview {
    VideoPlayerView(videoSelected: "lion", videoTitle: "lion")
        .previewLayout(.sizeThatFits)
        .padding()
}
