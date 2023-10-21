//
//  MapView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI
import MapKit

struct MapView: View {

    // MARK: Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        // In this way you set the zoom of the map
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    // MARK: Body
    var body: some View {
        // MARK: Basic Map
//        Map(coordinateRegion: $region)
//            .ignoresSafeArea()
        // MARK: Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) PIN: OLD STYLE (always static)
           // MapPin(coordinate: item.location, tint: .accentColor)

            // (B) MARKER: NEW STYLE (always static)
           // MapMarker(coordinate: item.location, tint: .accentColor)

            // (C) CUSTOM BASIC ANNOTATION (it could be static or interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: ANNOTATION

            // (D) CUSTOM ADVANCED ANNOTATION (it could be static or interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            } //: MAP ANNOTATION
        }) //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)

                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HSTACK

                    Divider()

                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HSTACK
                } //: VSTACK
            } //: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding(), alignment: .top
        )
    }
}

#Preview {
    MapView()
}
