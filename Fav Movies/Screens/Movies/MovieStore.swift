//
//  MovieStore.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 12/03/2025.
//

import SwiftUI

@Observable
class MovieStore {
    var isLoading = false
    var isMoreLoading = false
    private var movies = [Movie]()
    var error = ""
    var showError = false
    var searchTerm = ""
    
    var movieList: [Movie] {
        return if searchTerm.isEmpty {
            movies
        } else {
            movies.filter({$0.title.lowercased().contains(searchTerm.lowercased())})
        }
    }
    
    private var page = 1
    private var totalPages = 1
    
    func loadMovies() async {
        guard !isLoading, page <= totalPages else { return }
        
        if page == 1 {
            isLoading = true
        } else {
            isMoreLoading = true
        }
        
        do {
            let result = try await MovieAPI.shared.fetchTrendingMovies(page: page)
            if page == 1 {
                self.movies = result.results
            } else {
                let uniqueMovies = result.results.filter { newMovie in
                    !self.movies.contains(where: { $0.id == newMovie.id })
                }
                self.movies.append(contentsOf: uniqueMovies)
            }
            self.totalPages = result.totalPages
            self.page += 1
        } catch {
            self.error = error.asAFError?.localizedDescription ?? error.localizedDescription
        }
        
        if isLoading {
            isLoading = false
        } else {
            isMoreLoading = false
        }
    }
    
    func refresh() async {
        page = 1
        movies.removeAll()
        await loadMovies()
    }
}
