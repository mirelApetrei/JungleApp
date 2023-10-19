//
//  VideoListItem.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 18.10.23.
//

import SwiftUI

struct VideoListItemView: View {

    // MARK: - Properties
    let video: Video

    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4 )
            } //: ZStack

            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VStack
        } //: HStack
    }
}

//#Preview {
//    VideoListItem()
//}
