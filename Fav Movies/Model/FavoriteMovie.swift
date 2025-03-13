//
//  FavoriteMovie.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 13/03/2025.
//


import SwiftData

@Model
class FavoriteMovie {
    @Attribute(.unique) var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    var releaseDate: String
    var voteAverage: Double

    init(id: Int, title: String, overview: String, posterPath: String?, releaseDate: String, voteAverage: Double) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }

    convenience init(from movie: Movie) {
        self.init(
            id: movie.id,
            title: movie.title,
            overview: movie.overview,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage
        )
    }
    
    var movie: Movie {
        return .init(id: id,
                     title: title,
                     overview: overview,
                     posterPath: posterPath,
                     releaseDate: releaseDate,
                     voteAverage: voteAverage)
    }
}
