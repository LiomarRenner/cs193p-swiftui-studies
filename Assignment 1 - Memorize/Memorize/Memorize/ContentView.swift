//
//  ContentView.swift
//  Memorize
//
//  Created Liomar Renner on 02/06/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👽", "🛸", "👾", "🐈‍⬛"]

    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.purple)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let baseRR: RoundedRectangle = RoundedRectangle(cornerRadius: 16)
            if isFaceUp {
                baseRR.foregroundColor(.white)
                baseRR.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                baseRR
            }
        }
        .onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
