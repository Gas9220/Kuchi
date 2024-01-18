//
//  KuchiApp.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

@main
struct KuchiApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}

struct KuchiApp_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
