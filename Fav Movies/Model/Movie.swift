//
//  Movie.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 11/03/2025.
//

import SwiftData

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Decodable, Hashable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let mediaType: String
    let adult: Bool
    let originalLanguage: String
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, overview, adult, popularity, video
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case genreIds = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

#if DEBUG
extension Movie {
    static let sample = Movie(id: 1, title: "Wolf Man",
                              originalTitle: "Wolf Man",
                              overview: "With his marriage fraying, Blake persuades his wife Charlotte to take a break from the city and visit his remote childhood home in rural Oregon. As they arrive at the farmhouse in the dead of night, they\'re attacked by an unseen animal and barricade themselves inside the home as the creature prowls the perimeter. But as the night stretches on, Blake begins to behave strangely, transforming into something unrecognizable.",
                              posterPath: "/vtdEHG1j07PqLlVyhKNZRHTPKGt.jpg",
                              backdropPath: "/nNF4ZB0UDL4qAUjQfbYZDq3Ck7J.jpg",
                              mediaType: "",
                              adult: false,
                              originalLanguage: "EN",
                              genreIds: [],
                              popularity: 2,
                              releaseDate: "2025-01-15",
                              video: true,
                              voteAverage: 6.4,
                              voteCount: 499)
}
#endif
