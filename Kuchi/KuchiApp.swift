//
//  KuchiApp.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

@main
struct KuchiApp: App {
    @AppStorage("appearance") var appearance: Appearance = .automatic
    let userManager = UserManager()
    let challengesViewModel = ChallengesViewModel()
    
    init() {
        userManager.load()
    }
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
                .environmentObject(challengesViewModel)
                .preferredColorScheme(appearance.getColorScheme())
        }
    }
}

struct KuchiApp_Previews: PreviewProvider {
    static let userManager = UserManager(name: "Tom")
    static var previews: some View {
        StarterView()
            .environmentObject(userManager)
    }
}
