//
//  WelcomeView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcome-background", bundle: nil)
                .resizable()
                .aspectRatio(1 / 1, contentMode: .fill)
                .ignoresSafeArea()
                .saturation(0.5)
                .blur(radius: 5)
                .opacity(0.08)

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
                Image(systemName: "table")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .background(Color(white: 0.9))
                    .clipShape(Circle())
                    .foregroundColor(.red)
            }
            .labelStyle(HorizontallyAlignedLabelStyle())
        }
    }
}

#Preview {
    WelcomeView()
}
