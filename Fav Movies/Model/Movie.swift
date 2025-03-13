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
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

#if DEBUG
extension Movie {
    static let sample = Movie(id: 1, title: "Wolf Man",
                              overview: "With his marriage fraying, Blake persuades his wife Charlotte to take a break from the city and visit his remote childhood home in rural Oregon. As they arrive at the farmhouse in the dead of night, they\'re attacked by an unseen animal and barricade themselves inside the home as the creature prowls the perimeter. But as the night stretches on, Blake begins to behave strangely, transforming into something unrecognizable.",
                              posterPath: "/vtdEHG1j07PqLlVyhKNZRHTPKGt.jpg",
                              releaseDate: "2025-01-15",
                              voteAverage: 6.4)
}
#endif
