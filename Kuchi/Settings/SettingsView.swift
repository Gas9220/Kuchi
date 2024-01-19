//
//  SettingsView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 19/01/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var challengesViewModel: ChallengesViewModel
    @State var learningEnabled: Bool = true
    @AppStorage("dailyReminderEnabled") var dailyReminderEnabled = false
    @State var dailyReminderTime = Date(timeIntervalSince1970: 0)
    @AppStorage("dailyReminderTime") var dailyReminderTimeShadow: Double = 0
    @State var cardBackgroundColor: Color = .red
    @AppStorage("appearance") var appearance: Appearance = .automatic

    var body: some View {
        List {
            Text("Settings")
                .font(.largeTitle)
                .padding(.bottom, 8)

            Section {
                VStack(alignment: .leading) {
                    Picker("", selection: $appearance) {
                        ForEach(Appearance.allCases) { appearance in
                            Text(appearance.name)
                                .tag(appearance)
                        }
                    }
                    .pickerStyle(.segmented)

                    ColorPicker("Card Background Color", selection: $cardBackgroundColor)
                }

            } header: {
                Text("Appearance")
            }

            Section {
                VStack(alignment: .leading) {
                    Stepper("Number of questions: \(challengesViewModel.numberOfQuestions)",
                            value: $challengesViewModel.numberOfQuestions,
                            in: 3...20)

                    Text("Any change will affect the next game")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }

                Toggle("Learning enabled", isOn: $learningEnabled)
            } header: {
                Text("Game")
            }

            Section {
                HStack {
                    Toggle("Daily reminder", isOn: $dailyReminderEnabled)
                        .onChange(of: dailyReminderEnabled) { _, _ in
                            configureNotification()
                        }

                    DatePicker("", selection: $dailyReminderTime, displayedComponents: .hourAndMinute)
                        .disabled(!dailyReminderEnabled)
                        .onChange(of: dailyReminderTime) { _, newValue in
                            dailyReminderTimeShadow = newValue.timeIntervalSince1970
                            configureNotification()
                        }
                        .onAppear {
                            dailyReminderTime = Date(timeIntervalSince1970: dailyReminderTimeShadow)
                        }
                }
            } header: {
                Text("Notifications")
            }
        }
    }

    func configureNotification() {
        if dailyReminderEnabled {
            LocalNotifications.shared.createReminder(time: dailyReminderTime)
        } else {
            LocalNotifications.shared.deleteReminder()
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(ChallengesViewModel())
}
