//
//  ContentView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        // MARK: - Properties

        let animals: [Animal] = Bundle.main.decode("animals.json")
        // MARK: - BODY
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                ForEach(animals) { animal in
                        AnimalListItemView(animal: animal)

                } //: Loop
            } // List
            .navigationBarTitle("Africa-Jungle", displayMode: .large)
        } // Navigation
    }
}

#Preview {
    ContentView()
}
