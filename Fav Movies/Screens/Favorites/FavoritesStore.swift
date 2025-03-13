//
//  FavoritesManager.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 13/03/2025.
//


import SwiftData

@Observable
class FavoritesStore {
    var favorites: [FavoriteMovie] = []
    
    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
        loadFavorites()
    }

    func loadFavorites() {
        let descriptor = FetchDescriptor<FavoriteMovie>()
        if let movies = try? context.fetch(descriptor) {
            self.favorites = movies
        }
    }
    
    func toggleFavorite(_ movie: Movie) {
        if isFavorite(movie) {
            removeFavorite(movie)
        } else {
            addFavorite(movie)
        }
    }

    func addFavorite(_ movie: Movie) {
        if !favorites.contains(where: { $0.id == movie.id }) {
            let favoriteMovie = FavoriteMovie(from: movie)
            context.insert(favoriteMovie)
            save()
        }
    }

    func removeFavorite(_ movie: Movie) {
        if let existingMovie = favorites.first(where: { $0.id == movie.id }) {
            context.delete(existingMovie)
            save()
        }
    }

    func isFavorite(_ movie: Movie) -> Bool {
        return favorites.contains(where: { $0.id == movie.id })
    }

    private func save() {
        do {
            try context.save()
            loadFavorites()
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
