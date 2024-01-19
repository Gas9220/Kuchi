//
//  SettingsView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 19/01/24.
//

import SwiftUI

struct SettingsView: View {
    @State var numberOfQuestions = 6
    @State var learningEnabled: Bool = true
    @State var dailyReminderEnabled = false
    @State var dailyReminderTime = Date(timeIntervalSince1970: 0)

    var body: some View {
        List {
            Text("Settings")
                .font(.largeTitle)
                .padding(.bottom, 8)

            Section {

            } header: {
                Text("Appearance")
            }

            Section {
                VStack(alignment: .leading) {
                    Stepper("Number of questions: \(numberOfQuestions)",
                            value: $numberOfQuestions,
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
                        .onChange(of: dailyReminderTime) { _, _ in
                            configureNotification()
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
}
