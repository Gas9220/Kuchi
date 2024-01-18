//
//  WelcomeBackgroundImage.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
        Image("welcome-background", bundle: nil)
            .resizable()
            .aspectRatio(1 / 1, contentMode: .fill)
            .ignoresSafeArea()
            .saturation(0.5)
            .blur(radius: 5)
            .opacity(0.08)
    }
}

#Preview {
    WelcomeBackgroundImage()
}
