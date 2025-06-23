//
//  CardView.swift
//  EmojiMemoryGame
//
//  Created by Daniel Motta Ruiz Garcia on 18/06/25.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card

struct CardView: View {
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 16
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
    
    var body: some View {
        ZStack {
            let baseRR: RoundedRectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                baseRR.fill(.white)
                baseRR.strokeBorder(lineWidth: Constants.lineWidth)
                Path { p in
                    p.move(to: .zero)
                    p.addLine(to: CGPoint(x: 100, y: 100))
                }
                Pie(endAngle: .degrees(240))
                    .opacity(Constants.Pie.opacity)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(Constants.Pie.inset)
                    )
                    .padding(Constants.inset)

            }
                .opacity(card.isFaceUp ? 1 : 0)
            baseRR.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    HStack {
        CardView(Card(isFaceUp: true, content: "X", id: "test1"))
        CardView(Card(content: "X", id: "test2"))
    }
        .padding()
        .foregroundColor(.green)
}
