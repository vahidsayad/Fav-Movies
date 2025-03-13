//
//  MovieRow.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 12/03/2025.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 12) {
            Text(movie.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .foregroundStyle(Color.white)
            
            HStack {
                Text("Relase Date:")
                Spacer()
                Text(movie.releaseDate)
            }
            .font(.subheadline)
            .foregroundStyle(Color.gray)
        }
        .padding()
        .background {
            WebImage(url: URL(string: Constants.posterBaseURL + (movie.posterPath ?? ""))) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("movie-placeholder")
            }
            .overlay {
                Color.black.opacity(0.7)
            }
        }
        .background(.regularMaterial)
        .contentShape(.rect)
        .clipShape(.rect(cornerRadius: 5))
    }
}

#Preview {
    MovieRow(movie: .sample)
}
