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
    
    private struct FlyingConstants {
        static let shadowRadius: CGFloat = 1.5
        static let shadowX: CGFloat = 1
        static let shadowY: CGFloat = 1
        struct Animation {
            static let duration: CGFloat = 1.2
            static let offsetPositive: CGFloat = 50
            static let offsetNegative: CGFloat = -50
        }
    }


    var body: some View {
        if number != 0 {
            Text(number, format: .number.sign(strategy: .always()))
                .font(.largeTitle)
                .foregroundColor(number < 0 ? .red : .blue)
                .shadow(color: .black, radius: FlyingConstants.shadowRadius, x: FlyingConstants.shadowX, y: FlyingConstants.shadowY)
                .offset(x: 0, y: offset)
                .opacity(offset != 0 ? 0 : 1)
                .onAppear {
                    withAnimation(.easeIn(duration: FlyingConstants.Animation.duration)) {
                        offset = number < 0 ? FlyingConstants.Animation.offsetPositive : FlyingConstants.Animation.offsetNegative
                    }
                }
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
