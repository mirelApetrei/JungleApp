//
//  InsetGalleryView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - Properties

    let animal: Animal

    // MARK: - BODY
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                } //: LOOP
            } //: HSTACK
        } //: SCROLL
    }
}

//#Preview {
//    InsetGalleryView()
//}
