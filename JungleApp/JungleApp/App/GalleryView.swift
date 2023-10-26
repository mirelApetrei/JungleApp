//
//  GalleryView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")

    // Efficient Grid Definition
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    // Dynamic Grid Definition
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0

    // MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    // MARK: - BODY
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - HEADER IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 8)
                    )

                // MARK: - SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(  of: gridColumn, perform: { value in
                        gridSwitch()
                    }) 

                // MARK: - GRID
                LazyVGrid(columns: gridLayout,alignment: .center, spacing: 12) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    } //: LOOP
                }//: GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
