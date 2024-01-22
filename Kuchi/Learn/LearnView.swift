//
//  LearnView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 22/01/24.
//

import SwiftUI

struct LearnView: View {
    @StateObject var learningStore = LearningStore(deck: ChallengesViewModel.challenges)

    var body: some View {
        VStack {
            Spacer()
            Text("Swipe left if you remembered"
                 + "\nSwipe right if you didn’t")
            .font(.headline)
            DeckView(deck: learningStore.deck, onMemorized: { learningStore.score += 1 })
            Spacer()
            Text("Remembered \(learningStore.score)/" + "/\(learningStore.deck.cards.count)")
        }
    }
}

#Preview {
    LearnView()
}
