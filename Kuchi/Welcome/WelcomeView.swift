//
//  WelcomeView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userManager: UserManager
    @ObservedObject var challengesViewModel = ChallengesViewModel()
    @State var showPractice = false

    var body: some View {
        if showPractice {
            PracticeView(
                challengeTest: $challengesViewModel.currentChallenge,
                userName: $userManager.profile.name
            )
        } else {
            ZStack {
                WelcomeBackgroundImage()

                VStack {
                    Text(verbatim: "Hi, \(userManager.profile.name)")

                    WelcomeMessageView()

                    Button(action: {
                        self.showPractice = true
                    }, label: {
                        HStack {
                            Image(systemName: "play")
                            Text(verbatim: "Start")
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(UserManager())
}
