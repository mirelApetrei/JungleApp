//
//  ExternalWeblinkView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 18.10.23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - Properties
    let animal: Animal

    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://www.wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            } //: HStack
        } //: GroupBox
    }
}

//#Preview {
//    ExternalWeblinkView()
//}
