//
//  Router.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 13/03/2025.
//


import SwiftUI

typealias Route = any Hashable

@Observable
class Router {
    var navigationPath = NavigationPath()

    func navigate(to route: Route) {
        navigationPath.append(route)
    }

    func navigateBack() {
        navigationPath.removeLast()
    }

    func reset() {
        navigationPath = NavigationPath()
    }
}
