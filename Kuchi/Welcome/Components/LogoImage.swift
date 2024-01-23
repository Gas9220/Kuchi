//
//  LogoImage.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image(systemName: "table")
            .resizable()
            .accessibilityHidden(true)
            .frame(width: 30, height: 30)
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            .background(Color(white: 0.9))
            .clipShape(Circle())
            .foregroundColor(.red)
    }
}

#Preview {
    LogoImage()
}
