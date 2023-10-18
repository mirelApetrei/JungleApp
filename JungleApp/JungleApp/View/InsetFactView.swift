//
//  InsetFactView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 18.10.23.
//

import SwiftUI

struct InsetFactView: View {

    // MARK: - Properties
    let animal: Animal

    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: BOX
    }
}

//#Preview {
//    let animals: [Animal] = Bundle.main.decode("animals.json") as [Animal]
//    InsetFactView(animal: animals[0])
//}
