//
//  Home.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 12/03/2025.
//

import SwiftUI

struct Home: View {
    @State private var currentTab: TabItem = .movies
    
    var body: some View {
        TabView {
            Movies()
                .tag(TabItem.movies)
                .tabItem {
                    Label("Movies", systemImage: "movieclapper.fill")
                }
            
            Text("Favorites")
                .tag(TabItem.favorites)
                .tabItem {
                    Label("Favorites", systemImage: "hand.thumbsup.fill")
                }
        }
    }
}

#Preview {
    Home()
}
