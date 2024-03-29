//
//  StarterView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userViewModel: UserManager

    var body: some View {
        if userViewModel.isRegistered {
            WelcomeView()
        } else {
            RegisterView()
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
