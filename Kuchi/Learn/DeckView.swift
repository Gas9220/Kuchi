//
//  DeckView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 22/01/24.
//

import SwiftUI

enum DiscardedDirection {
    case left
    case right
}

struct DeckView: View {
    @ObservedObject var deck: FlashDeck

    @AppStorage("cardBackgroundColor") var cardBackgroundColorInt: Int = 0xFF0000FF

    let onMemorized: () -> Void

    init(deck: FlashDeck, onMemorized: @escaping () -> Void) {
        self.deck = deck
        self.onMemorized = onMemorized
    }

    var body: some View {
        ZStack {
            ForEach(deck.cards.filter { $0.isActive }) { card in
                getCardView(for: card)
            }
        }
    }

    func getCardView(for card: FlashCard) -> CardView {
        let activeCards = deck.cards.filter { $0.isActive == true }
        if let lastCard = activeCards.last {
            if lastCard == card {
                return createCardView(for: card)
            }
        }

        let view = createCardView(for: card)

        return view
    }

    func createCardView(for card: FlashCard) -> CardView {
        let view = CardView(card,
                            cardColor: Binding(
                                get: { Color(rgba: cardBackgroundColorInt) },
                                set: { newValue in cardBackgroundColorInt = newValue.asRgba }
                            ), onDrag: { card, direction in
                                if direction == .left {
                                    onMemorized()
                                }
                            }
        )

        return view
    }
}

#Preview {
    DeckView(deck: FlashDeck(from: ChallengesViewModel.challenges), onMemorized: {})
}
