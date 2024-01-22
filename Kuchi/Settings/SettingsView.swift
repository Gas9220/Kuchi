//
//  SettingsView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 19/01/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var challengesViewModel: ChallengesViewModel

    @AppStorage("learningEnabled") var learningEnabled: Bool = true
    @AppStorage("dailyReminderEnabled") var dailyReminderEnabled = false
    @AppStorage("dailyReminderTime") var dailyReminderTimeShadow: Double = 0
    @AppStorage("cardBackgroundColor") var cardBackgroundColorInt: Int = 0xFF0000FF
    @AppStorage("appearance") var appearance: Appearance = .automatic

    @State var dailyReminderTime = Date(timeIntervalSince1970: 0)
    @State var cardBackgroundColor: Color = .red

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
                            cardBackgroundColor = Color(rgba: cardBackgroundColorInt)
                        }
                }
            } header: {
                Text("Notifications")
            }
        }
        .onChange(of: cardBackgroundColor) { _, newValue in
            cardBackgroundColorInt = newValue.asRgba
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
