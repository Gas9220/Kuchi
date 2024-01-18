//
//  ChallengeView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct ChallengeView: View {
    let challengeTest: ChallengeTest
    
    @State var showAnswers = false
    
    var body: some View {
        VStack {
            Button(action: {
                showAnswers.toggle()
            }) {
                QuestionView(question: challengeTest.challenge.question)
                    .frame(height: 300)
            }
            
            if showAnswers {
                Divider()
                ChoicesView(challengeTest: challengeTest)
                    .frame(height: 300)
                    .padding()
            }
        }
    }
}

#Preview {
    let challengeTest = ChallengeTest(
        challenge: Challenge(
            question: "おねがい　します",
            pronunciation: "Onegai shimasu",
            answer: "Please"
        ),
        answers: ["Thank you", "Hello", "Goodbye"]
    )
    
    return ChallengeView(challengeTest: challengeTest)
}
