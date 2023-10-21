//
//  GalleryView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text("Gallery!")
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
