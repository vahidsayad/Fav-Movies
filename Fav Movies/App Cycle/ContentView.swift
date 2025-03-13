//
//  ContentView.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 11/03/2025.
//

import SwiftUI
import SwiftData

enum TabItem {
    case movies, favorites
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var router = Router()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            Home()
                .environment(router)
                .navigationDestination(for: MovieRouter.self) { route in
                    switch route {
                    case .detail(let movie):
                        MovieDetail(movie: movie)
                            .environment(router)
                    }
                }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
