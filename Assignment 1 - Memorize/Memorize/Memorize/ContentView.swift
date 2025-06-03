//
//  ContentView.swift
//  Memorize
//
//  Created Liomar Renner on 02/06/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👽", "🛸", "👾", "🐈‍⬛", "👻", "☠️", "💀", "🐍", "🕸️", "🦉", "🦇", "🎃"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(contentMode: .fit)
            }
        }
        .foregroundColor(.purple)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 2 || cardCount + offset > emojis.count)
        
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -2, symbol: "minus.circle.fill")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +2, symbol: "plus.circle.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let baseRR: RoundedRectangle = RoundedRectangle(cornerRadius: 16)
            Group {
                baseRR.fill(.white)
                baseRR.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            baseRR.fill().opacity(isFaceUp ? 0 : 1)
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
