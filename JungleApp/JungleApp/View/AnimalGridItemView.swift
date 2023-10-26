//
//  AnimalGridItemView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 26.10.23.
//

import SwiftUI

struct AnimalGridItemView: View {

    let animal: Animal

    var body: some View {
       Image(animal.image)
        .resizable()
        .scaledToFit()
        .cornerRadius(12)
    }
}

//#Preview {
//    let animals: [Animal] = Bundle.main.decode("animals.json")
//    AnimalGridItemView(animal: animals[0])
//        .previewLayout(.sizeThatFits)
//        .padding()
//}
