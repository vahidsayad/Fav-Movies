//
//  Movies.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 12/03/2025.
//

import SwiftUI

struct Movies: View {
    @State private var store = MovieStore()
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            if store.isLoading {
                ProgressView()
            } else {
                TextField(text: $store.searchTerm,
                          prompt: Text("Search Movies")) {
                    
                }
                          .padding()
                          .background(Color.white
                            .clipShape(.rect(cornerRadius: 8)))
                          .padding([.horizontal, .top])
                
                if store.movieList.isEmpty, !store.isLoading {
                    Spacer()
                    Text("No movies found")
                        .foregroundColor(.secondary)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(store.movieList, id: \.id) { movie in
                                MovieRow(movie: movie)
                                    .padding(.horizontal)
                                    .onAppear {
                                        if movie.id == store.movieList.last?.id {
                                            Task {
                                                await store.loadMovies()
                                            }
                                        }
                                    }
                                    .onTapGesture {
                                        router.navigate(to: MovieRouter.detail(movie))
                                    }
                            }
                        }
                    } .refreshable {
                        Task {
                            await store.refresh()
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .defaultBackground()
        .task {
            await store.loadMovies()
        }
        .alert("Error Occured!",
               isPresented: $store.showError) {
            Button {
                store.showError = false
            } label: {
                Text("OK")
            }
        } message: {
            Text(store.error)
        }
        .toolbar(.hidden)
    }
}

#Preview {
    Movies()
        .environment(Router())
}
