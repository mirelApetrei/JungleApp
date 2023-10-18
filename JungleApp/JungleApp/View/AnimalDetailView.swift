//
//  AnimalDetailView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - Properties
    let animal: Animal

    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16) {
                //: HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()

                //: TITLE
                Text(animal.name.uppercased())
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )

                //: HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)

                //: GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")

                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)

                //: FACTS
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")

                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)

                //: DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")

                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)

                //: MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")

                    InsetMapView()
                }
                .padding(.horizontal)

                //: LINK
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")

                    ExternalWeblinkView(animal: animal)
                }

            } //: VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        } //: SCROLL

    }
}


//#Preview {
//
//    AnimalDetailView(animal: Animal( id: "123", name: "Tiger", headline: "Tiger Headline", gallery: [],  description: "Tiger description", link: "Tiger link", image: "tiger", fact: []))
//
//}
