//
//  FlashDeck.swift
//  Kuchi
//
//  Created by Gaspare Monte on 22/01/24.
//

import Foundation

class FlashDeck: ObservableObject {
    @Published var cards: [FlashCard]

    init(from words: [Challenge]) {
        cards = words.map {
            FlashCard(card: $0)
        }
    }
}
