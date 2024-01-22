//
//  DeckView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 22/01/24.
//

import SwiftUI

struct DeckView: View {
    @ObservedObject var deck: FlashDeck

    let onMemorized: () -> Void

    init(deck: FlashDeck, onMemorized: @escaping () -> Void) {
        self.deck = deck
        self.onMemorized = onMemorized
    }

    var body: some View {
        ZStack {
            CardView()
            CardView()
        }
    }
}

#Preview {
    DeckView(deck: FlashDeck(from: ChallengesViewModel.challenges), onMemorized: {})
}
