//
//  WelcomeMessageView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct WelcomeMessageView: View {
    var body: some View {
        Label {
            VStack(alignment: .leading) {
                Text("Welcome to")
                    .font(.headline)
                    .bold()
                
                Text("Kuchi")
                    .font(.largeTitle)
                    .bold()
            }
            .foregroundColor(.red)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
        } icon: {
            LogoImage()
        }
        .labelStyle(HorizontallyAlignedLabelStyle())
    }
}

#Preview {
    WelcomeMessageView()
}
