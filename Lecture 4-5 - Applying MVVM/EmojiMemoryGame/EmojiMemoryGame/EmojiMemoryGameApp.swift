//
//  EmojiMemoryGameApp.swift
//  EmojiMemoryGame
//
//  Created by Liomar Renner on 04/06/25.
//

import SwiftUI

@main
struct EmojiMemoryGameApp: App {
    @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
