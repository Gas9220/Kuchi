//
//  PracticeView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct PracticeView: View {
    @Binding var challengeTest: ChallengeTest?
    @Binding var userName: String
    
    var body: some View {
        if challengeTest != nil {
            ChallengeView(challengeTest: challengeTest!)
        } else {
            CongratulationsView(userName: userName)
        }
    }
}

#Preview {
    @State var numberOfAnswered: Int = 0
    let challengeTest = ChallengeTest(
        challenge: Challenge(question: "おねがい　します", pronunciation: "Onegai shimasu", answer: "Please"),
        answers: ["Thank you", "Hello", "Goodbye"]
    )
    
    return PracticeView(challengeTest: .constant(challengeTest), userName: .constant("Tom Swift"))
}
