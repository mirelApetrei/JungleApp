//
//  MapAnnotationView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 19.10.23.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: Properties
    var location: NationalParkLocation
    @State private var animation: Double = 0.0

    // MARK: Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)

            Circle()
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation) 

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}
//
//#Preview {
//    var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
//    MapAnnotationView(location: locations[0])
//}
