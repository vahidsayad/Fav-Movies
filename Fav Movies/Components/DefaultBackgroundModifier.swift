//
//  DefaultBackgroundModifier.swift
//  Fav Movies
//
//  Created by Vahid Sayad on 13/03/2025.
//

import SwiftUI

struct DefaultBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                LinearGradient(colors: [
                    Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
                    Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
                ],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .overlay {
                    Color.black.opacity(0.5)
                }
                .ignoresSafeArea()
            }
    }
}

extension View {
    func defaultBackground() -> some View {
        modifier(DefaultBackgroundModifier())
    }
}

#Preview {
    VStack {
        
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .defaultBackground()
}
