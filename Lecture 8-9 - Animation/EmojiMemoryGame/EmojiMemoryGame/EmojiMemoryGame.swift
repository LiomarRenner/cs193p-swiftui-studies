//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Liomar Renner on 04/06/25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👽", "🛸", "👾", "🐈‍⬛", "👻", "☠️", "💀", "🐍", "🕸️", "🦉", "🦇", "🎃"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "!!??"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color {
        .purple
    }
    
    var score: Int {
        model.score
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
