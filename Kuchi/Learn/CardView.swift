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

    @State private var revealed: Bool = false
    @State private var offset: CGSize = .zero

    typealias CardDrag = (_ card: FlashCard, _ direction: DiscardedDirection) -> Void
    let dragged: CardDrag

    init(_ card: FlashCard, cardColor: Binding<Color>, onDrag dragged: @escaping CardDrag = {_, _ in }) {
        self.flashCard = card
        _cardColor = cardColor
        self.dragged = dragged
    }

    var body: some View {
        let drag = DragGesture()
            .onChanged { offset = $0.translation }
            .onEnded {
                if $0.translation.width < -100 {
                    offset = .init(width: -1000, height: 0)
                    dragged(flashCard, .left)
                } else if $0.translation.width > 100 {
                    offset = .init(width: 1000, height: 0)
                    dragged(flashCard, .right)
                } else {
                    offset = .zero
                }
            }

        return ZStack {
            Rectangle()
                .fill(cardColor)
                .frame(width: 320, height: 210)
                .cornerRadius(12)
            VStack {
                Spacer()

                Text(flashCard.card.question)
                    .font(.largeTitle)
                    .foregroundColor(.white)

                if revealed {
                    Text(flashCard.card.answer)
                        .font(.caption)
                        .foregroundColor(.white)
                }

                Spacer()
            }
        }
        .shadow(radius: 8)
        .frame(width: 320, height: 210)
        .animation(.spring(), value: offset)
        .gesture(TapGesture()
            .onEnded {
                withAnimation(.easeIn) {
                    revealed.toggle()
                }
            }
        )
        .offset(offset)
        .gesture(drag)
    }
}

#Preview {
    let card = FlashCard(card: Challenge(question: "こんにちわ", pronunciation: "Konnichiwa", answer: "Hello"))
    return CardView(card, cardColor: .constant(.red))
}
