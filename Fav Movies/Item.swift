//
//  Item.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 11/03/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
