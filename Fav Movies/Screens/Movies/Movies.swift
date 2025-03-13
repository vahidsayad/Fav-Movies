//
//  Movies.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 12/03/2025.
//

import SwiftUI

struct Movies: View {
    //    @Environment(HomeStore.self) var store
    @State private var store = MovieStore()
//    @Environment(Router.self) var router
    @State var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
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
            .background {
                LinearGradient(colors: [
                    Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
                    Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
                ],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            }
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
            .navigationDestination(for: MovieRouter.self) { route in
                switch route {
                case .detail(let movie):
                    MovieDetail(movie: movie)
                        .environment(router)
                }
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Movies()
        .environment(Router())
}
