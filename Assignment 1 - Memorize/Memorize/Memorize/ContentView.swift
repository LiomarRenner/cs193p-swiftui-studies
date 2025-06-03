//
//  ContentView.swift
//  Memorize
//
//  Created Liomar Renner on 02/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundColor(.purple)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let baseRR: RoundedRectangle = RoundedRectangle(cornerRadius: 16)
            if isFaceUp {
                baseRR.foregroundColor(.white)
                baseRR.strokeBorder(lineWidth: 2)
                Text("👽").font(.largeTitle)
            } else {
                baseRR
            }
        }
    }
}

#Preview {
    ContentView()
}
