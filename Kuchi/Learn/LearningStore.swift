//
//  LearningStore.swift
//  Kuchi
//
//  Created by Gaspare Monte on 22/01/24.
//

import Foundation

class LearningStore: ObservableObject {
    @Published var deck: FlashDeck
    @Published var card: FlashCard?
    @Published var score = 0

    init(deck: [Challenge]) {
        self.deck = FlashDeck(from: deck)
        self.card = getNextCard()
    }

    func getNextCard() -> FlashCard? {
        guard let card = deck.cards.last else {
            return nil
        }

        self.card = card
        deck.cards.removeLast()

        return self.card
    }
}
