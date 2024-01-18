//
//  KuchiApp.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

@main
struct KuchiApp: App {
    let userManager = UserManager()

    init() {
        userManager.load()
    }

    var body: some Scene {
        WindowGroup {
            RegisterView()
                .environmentObject(userManager)
        }
    }
}

#Preview {
    let userManager = UserManager(name: "Tom")

    return RegisterView()
        .environmentObject(userManager)
}
