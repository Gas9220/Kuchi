//
//  CardView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 22/01/24.
//

import SwiftUI

struct CardView: View {
    @Binding var cardColor: Color

    let flashCard: FlashCard

    init(_ card: FlashCard, cardColor: Binding<Color>) {
        self.flashCard = card
        _cardColor = cardColor
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(cardColor)
                .frame(width: 320, height: 210)
                .cornerRadius(12)
            VStack {
                Spacer()
                Text(flashCard.card.question)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text(flashCard.card.answer)
                    .font(.caption)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .shadow(radius: 8)
        .frame(width: 320, height: 210)
        .animation(.spring(), value: 0)
    }
}

#Preview {
    let card = FlashCard(card: Challenge(question: "こんにちわ", pronunciation: "Konnichiwa", answer: "Hello"))
    return CardView(card, cardColor: .constant(.red))
}
