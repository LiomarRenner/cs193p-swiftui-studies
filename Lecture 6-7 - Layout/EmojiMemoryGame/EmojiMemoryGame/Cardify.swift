//
//  Cardify.swift
//  EmojiMemoryGame
//
//  Created by Liomar Renner on 23/06/25.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool

    private struct Constants {
        static let cornerRadius: CGFloat = 16
        static let lineWidth: CGFloat = 2
    }

    func body(content: Content) -> some View {
        ZStack {
            let baseRR: RoundedRectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            baseRR.strokeBorder(lineWidth: Constants.lineWidth)
                .background(baseRR.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            baseRR.fill()
                .opacity(isFaceUp ? 0 : 1)
        }

    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
