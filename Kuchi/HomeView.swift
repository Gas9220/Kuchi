//
//  HomeView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var challengesViewModel: ChallengesViewModel

    @AppStorage("learningEnabled") var learningEnabled: Bool = true

    @State var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            if learningEnabled {
                LearnView()
                    .tabItem {
                        VStack {
                            Image(systemName: "bookmark")
                            Text("Learn")
                        }
                    }
                    .tag(0)
            }

            PracticeView(
                challengeTest: $challengesViewModel.currentChallenge,
                userName: $userManager.profile.name,
                numberOfAnswered: .constant(challengesViewModel.numberOfAnswered)
            )
            .tabItem {
                VStack {
                    Image(systemName: "rectangle.dock")
                    Text("Challenge")
                }
            }
            .tag(1)

            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(2)
        }
        .tint(.orange)
    }
}

#Preview {
    HomeView()
        .environmentObject(UserManager())
        .environmentObject(ChallengesViewModel())
}
