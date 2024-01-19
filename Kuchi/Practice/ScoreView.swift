//
//  ScoreView.swift
//  Kuchi
//
//  Created by Gaspare Monte on 19/01/24.
//

import SwiftUI

struct ScoreView: View {

    let numberOfQuestions: Int

    @State var numberOfAnswered = 0

    var body: some View {
        HStack {
            Text("\(self.numberOfAnswered)/\(numberOfQuestions)")
                .font(.caption)
                .padding(4)
            Spacer()
        }
    }
}

#Preview {
    ScoreView(numberOfQuestions: 5)
}