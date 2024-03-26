//
//  ActivationView.swift
//  Scratchy
//
//  Created by Marek Polak on 26/03/2024.
//

import SwiftUI

struct ActivationView: View {
    let card: CardModel
    let viewModel: ActivationVM

    var body: some View {
        VStack {

            if viewModel.isLoading {
                ProgressView {
                    Text("Loading...")
                }
            } else {
                Button {
                    Task {
                        try await viewModel.activate(card: card)
                    }
                } label: {
                    Text("Activate")
                }
            }
        }

    }
}

#Preview {
    ActivationView(
        card: .init(cardId: ""),
        viewModel: .init()
    )
}
