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

    @GestureState private var isLongPressed: Bool = false

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

        let longPress = LongPressGesture()
            .updating($isLongPressed) { value, state, transition in
                state = value
            }
            .simultaneously(with: drag)

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
        .offset(offset)
        .gesture(longPress)
        .scaleEffect(isLongPressed ? 1.1 : 1)
        .animation(.easeInOut(duration: 0.3), value: isLongPressed)
        .simultaneousGesture(TapGesture()
            .onEnded {
                withAnimation(.easeIn) {
                    revealed.toggle()
                }
            }
        )
    }
}

#Preview {
    let card = FlashCard(card: Challenge(question: "こんにちわ", pronunciation: "Konnichiwa", answer: "Hello"))
    return CardView(card, cardColor: .constant(.red))
}
