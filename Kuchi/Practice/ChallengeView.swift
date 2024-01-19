//
//  ChallengeView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct ChallengeView: View {
    let challengeTest: ChallengeTest
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var numberOfAnswered: Int
    @State var showAnswers = false

    var body: some View {
        if verticalSizeClass == .compact {
            VStack {
                HStack {
                    Button(action: {
                        showAnswers = !showAnswers
                    }) {
                        QuestionView(
                            question: challengeTest.challenge.question)
                    }
                    if showAnswers {
                        Divider()
                        ChoicesView(challengeTest: challengeTest)
                    }
                }
                ScoreView(
                    numberOfQuestions: 5,
                    numberOfAnswered: $numberOfAnswered
                )
            }
        } else {
            VStack {
                Button(action: {
                    showAnswers = !showAnswers
                }) {
                    QuestionView(
                        question: challengeTest.challenge.question)
                    .frame(height: 300)
                }
                ScoreView(
                    numberOfQuestions: 5,
                    numberOfAnswered: $numberOfAnswered
                )
                if showAnswers {
                    Divider()
                    ChoicesView(challengeTest: challengeTest)
                        .frame(height: 300)
                        .padding()
                }
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

    return ChallengeView(challengeTest: challengeTest, numberOfAnswered: .constant(0))
}
