//
//  Home.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 12/03/2025.
//

import SwiftUI

struct Home: View {
    @State private var currentTab: TabItem = .movies
    
    init() {
//        setupTabBarAppearance()
    }
    
    var body: some View {
        TabView {
            Movies()
                .tag(TabItem.movies)
                .tabItem {
                    Label("Movies", systemImage: "movieclapper.fill")
                        .tint(Color.red)
                }
                .toolbarBackground(Color.black.opacity(0.7), for: .tabBar)
            
            Favorites()
                .tag(TabItem.favorites)
                .tabItem {
                    Label("Favorites", systemImage: "hand.thumbsup.fill")
                }
                .toolbarBackground(Color.black.opacity(0.7), for: .tabBar)
        }
        .tint(Color.white)
    }
}

#Preview {
    Home()
        .environment(Router())
}
