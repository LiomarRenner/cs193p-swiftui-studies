//
//  FlyingNumber.swift
//  EmojiMemoryGame
//
//  Created by Liomar Renner on 08/07/25.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    @State private var offset: CGFloat = 0

    var body: some View {
        if number != 0 {
            Text(number, format: .number.sign(strategy: .always()))
                .font(.largeTitle)
                .foregroundColor(number < 0 ? .red : .blue)
                .shadow(color: .black, radius: 1.5, x: 1, y: 1)
                .offset(x: 0, y: offset)
                .onAppear {
                    withAnimation {
                        offset = number < 0 ? 50 : -50
                    }
                }
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
