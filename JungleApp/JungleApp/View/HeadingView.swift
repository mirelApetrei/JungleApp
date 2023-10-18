//
//  HeadingView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - Properties
    var headingImage: String
    var headingText: String

    // MARK: - BODY
    var body: some View {
        HStack {

            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)

        } //: HSTACK
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
}
