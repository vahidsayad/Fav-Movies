//
//  MovieDetail.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 13/03/2025.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftData

struct MovieDetail: View {
    let movie: Movie
    @Environment(Router.self) var router
//    @Environment(FavoritesStore.self) var favoritesStore
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Button {
                    router.navigateBack()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(0.8)
                        .padding([.top, .horizontal])
                }
                
                Text(movie.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title.weight(.bold))
                    .padding(.top)
                
                Spacer()
                
//                Button {
////                    favoritesStore.toggleFavorite(movie)
//                } label: {
//                    Image(systemName: "heart" + (favoritesStore.isFavorite(movie) ? ".fill" : ""))
//                        .resizable()
//                        .foregroundStyle(favoritesStore.isFavorite(movie) ? .red : .white)
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 30)
//                        .padding([.horizontal, .top])
//                }
            }
            .foregroundStyle(Color.white)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text(movie.overview)
                        .font(.callout)
                        .lineSpacing(7)
                    
                    HStack {
                        Text("Relase Date: ")
                        Text(movie.releaseDate)
                        Spacer()
                    }
                    .font(.caption)
                    
                    HStack {
                        Text("User Rating:")
                        Spacer()
                        Image(systemName: "medal.star")
                            .resizable()
                            .frame(width: 20, height: 30)
                            .foregroundStyle(rateColor)
                            .offset(y: 4)
                        Text("\(String(format: "%0.1f", movie.voteAverage))")
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.title2)
                    }
                    .padding(12)
                    .background {
                        rateColor.blur(radius: 2).opacity(0.2)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
        .background {
            WebImage(url: URL(string: Constants.posterBaseURL + (movie.posterPath ?? ""))) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("movie-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .overlay {
                LinearGradient(colors: [.black.opacity(0.7), .black.opacity(0.2)],
                               startPoint: .top,
                               endPoint: .bottom)
            }
            .ignoresSafeArea()
        }
        .toolbar(.hidden)
        .navigationBarBackButtonHidden()
    }
    
    private var rateColor: Color {
        switch movie.voteAverage {
        case 8...10:
            return .yellow
        case 7..<8:
            return .orange
        case 5..<7:
            return .pink
        default:
            return .red
        }
    }
}

#Preview {
    NavigationView {
        MovieDetail(movie: .sample)
            .environment(Router())
    }
}
