//
//  Fav_MoviesApp.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 11/03/2025.
//

import SwiftUI
import SwiftData

@main
struct Fav_MoviesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([FavoriteMovie.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(FavoritesStore(context: sharedModelContainer.mainContext))
        .modelContainer(sharedModelContainer)
    }
}
