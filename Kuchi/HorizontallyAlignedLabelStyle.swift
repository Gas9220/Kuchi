//
//  HorizontallyAlignedLabelStyle.swift
//  Kuchi
//
//  Created by Gaspare Monte on 18/01/24.
//

import SwiftUI

struct HorizontallyAlignedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}
