//
//  LoadMovies.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 12/03/2025.
//

import Alamofire

actor MovieAPI {
    static let shared = MovieAPI()
    
    private let baseURL = "https://api.themoviedb.org/3"
    
    func fetchTrendingMovies(page: Int) async throws -> MovieResponse {
        let endpoint = "\(baseURL)/trending/movie/day?page=\(page)"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.accessToken)",
            "Accept": "application/json"
        ]
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(endpoint, method: .get, headers: headers)
                .validate()
                .responseDecodable(of: MovieResponse.self) { response in
                    switch response.result {
                    case .success(let movieResponse):
                        continuation.resume(returning: movieResponse)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
