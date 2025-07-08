//
//  FlyingNumber.swift
//  EmojiMemoryGame
//
//  Created by Daniel Motta Ruiz Garcia on 08/07/25.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int

    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
