//
//  CoverImgageView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct CoverImageView: View {

//    MARK: - PROPERTIES

    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

//    MARK: - BODY



    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
        } //: TAB 
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
