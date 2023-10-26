//
//  ContentView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var isGridViewActive: Bool = false

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

    // MARK: - Functions
    func gridSwitch() {
        /// This line of code is used to create a flexible grid layout.
        /// The number of columns in the grid is determined by the remainder of the division of the count of the grid layout by 3, plus 1.
        /// This ensures that the grid layout will always have at least one column, and at most three columns.
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)

        gridColumn = gridLayout.count

        // TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    // MARK: - BODY
    var body: some View {

        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: Loop
                    } //: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: LINK
                            } //: Loop
                        } //: LazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    } //: Scroll
                } // Conditional
            } //: Group
            .navigationBarTitle("Africa-Jungle", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        } //: Button

                        // Grid
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        } //: Button
                    } //: HStack
                } //: ToolbarItem
            } //: Toolbar
        } // Navigation
    }
}

#Preview {
    ContentView()
}
