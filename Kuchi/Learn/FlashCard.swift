//
//  FlashCard.swift
//  Kuchi
//
//  Created by Gaspare Monte on 22/01/24.
//

import Foundation

struct FlashCard: Identifiable {
    let id: UUID = UUID()
    var card: Challenge
    var isActive = true
}

extension FlashCard: Equatable {
    static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
        return lhs.card.question == rhs.card.question && lhs.card.answer == rhs.card.answer
    }
}
