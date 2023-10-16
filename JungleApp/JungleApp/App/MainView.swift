//
//  MainView.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 16.10.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Browse", systemImage: "globe")
                }
            VideoListView()
                .tabItem {
                    Label("watch", systemImage: "tv")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            GalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo")
                }
        }
    }
}

#Preview {
    MainView()
}
