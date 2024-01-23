//
//  RegisterView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager

    @FocusState var nameFieldFocused: Bool

    var body: some View {
        VStack {
            Spacer()

            WelcomeMessageView()

            TextField("Type your name", text: $userManager.profile.name)
                .focused($nameFieldFocused)
                .submitLabel(.done)
                .onSubmit(registerUser)
                .bordered()

            HStack {
                Spacer()
                Text("\(userManager.profile.name.count)")
                    .accessibilityLabel("name has \(userManager.profile.name.count) letters")
                    .accessibilityHint("name needs 3 or more letters to enable OK button")
                    .font(.caption)
                    .foregroundColor(
                        userManager.isUserNameValid() ? .green : .red)
                    .padding(.trailing)
            }
            .padding(.bottom)

            HStack {
                Spacer()

                Toggle(isOn: $userManager.settings.rememberUser) {
                    Text("Remember me")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .fixedSize()
            }

            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("OK")
                        .font(.body)
                        .bold()
                }
            }
            .accessibilityLabel("OK registers user")
            .accessibilityHint("name needs 3 or more letters to enable OK button")
            .accessibilityValue(userManager.isUserNameValid() ? "enabled" : "disabled")
            .bordered()
            .disabled(!userManager.isUserNameValid())

            Spacer()
        }
        .padding()
        .background(WelcomeBackgroundImage())
    }
}

#Preview {
    let user = UserManager(name: "Tom")

    return RegisterView()
        .environmentObject(user)
}

extension RegisterView {
    func registerUser() {
        nameFieldFocused = false

        if userManager.settings.rememberUser {
            userManager.persistProfile()
        } else {
            userManager.clear()
        }

        userManager.persistSettings()
        userManager.setRegistered()
    }
}
