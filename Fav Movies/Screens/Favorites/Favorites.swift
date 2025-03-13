//
//  Favorites.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 13/03/2025.
//

import SwiftUI

struct Favorites: View {
    @Environment(FavoritesStore.self) var store
    @Environment(Router.self) var router
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(store.favorites, id:\.id) { favorite in
                    MovieRow(movie: favorite.movie)
                        .padding(.horizontal)
                        .onTapGesture {
                            router.navigate(to: MovieRouter.detail(favorite.movie))
                        }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .defaultBackground()
    }
}

#Preview {
    Favorites()
}
