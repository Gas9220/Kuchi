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

            TextField("Type your name...", text: $userManager.profile.name)
                .focused($nameFieldFocused)
                .submitLabel(.done)
                .bordered()

            Button(action: self.registerUser) {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("OK")
                        .font(.body)
                        .bold()
                }
            }
            .bordered()

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
        userManager.persistProfile()
    }
}
