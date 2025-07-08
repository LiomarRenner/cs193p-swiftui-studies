//
//  Cardify.swift
//  EmojiMemoryGame
//
//  Created by Liomar Renner on 23/06/25.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }

    var isFaceUp: Bool {
        rotation < 90
    }

    private struct Constants {
        static let cornerRadius: CGFloat = 16
        static let lineWidth: CGFloat = 2
    }
    
    var rotation: Double

    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
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
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))

    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
